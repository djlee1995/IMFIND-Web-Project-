
package com.spring.imfind.el.MJ;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MJController {

   @Autowired
   private ItemService itemService;

   // MJ Item 조회

   @RequestMapping("/item")
   public String item() {

      return "el/MJ/item";
   }

   @RequestMapping("/iteminfo")
   public String iteminfo() {

      return "el/MJ/iteminfo";
   }

   @RequestMapping("/updatepage")
   public String updatepage() {

      return "el/MJ/updateitem";
   }

   @RequestMapping(value = "/deletepage", produces = "application/json;charset=UTF-8")
   public String deletepage(@RequestParam(value = "lost_PostNum") int lost_PostNum) {
      itemService.delete_data(lost_PostNum);

      return "redirect:/item";
   }

   /*
    * 
    * 민정 - 게시판 조회
    * 
    */
   @ResponseBody
   @RequestMapping(value = "/list.do", produces = "application/json;charset=UTF-8")
   public List<ItemVO> item(ItemVO vo) {

      List<ItemVO> list = itemService.getItemservice(vo);

      return list;
   }

   @ResponseBody
   @RequestMapping(value = "/search.do", produces = "application/json;charset=UTF-8")
   public List<ItemVO> list(@RequestParam(value = "lost_Title") String lost_Title) {

      List<ItemVO> list = itemService.getItemservice(lost_Title);
      System.out.println("list" + list);

      return list;

   }

   @RequestMapping(value = "/sido.do", produces = "application/json; charset=utf-8")
   @ResponseBody
   public List<SelectVO> sido(@RequestParam(value = "sido", required = false) String sido,
         @RequestParam(value = "gu", required = false) String gu,
         @RequestParam(value = "dong", required = false) String dong) {
      List<SelectVO> list = itemService.getSido(sido, gu, dong);

      return list;
   }

   @ResponseBody
   @RequestMapping(value = "/datainfo.do", produces = "application/json;charset=UTF-8")
   public List<ItemVO> datainfo(@RequestParam(value = "lost_PostNum") int lost_PostNum) {

      List<ItemVO> list = itemService.getdata_info(lost_PostNum);

      return list;

   }

   @RequestMapping("/update.do")
   public String update_data(ItemVO vo) {
      System.out.println("업데이트 vo " + vo);
      Pattern pattern = Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>"); // 이미지태그 자르기
      String content = vo.getLost_Content();
      Matcher match = pattern.matcher(content);
      String Lost_Up_File = null;
      String uploadPath = "C:\\Project\\WebProject\\upload\\";

      if (match.find()) {
         Lost_Up_File = match.group(0);
      }
      vo.setLost_Up_File(Lost_Up_File); // 이미지 태그 Lost_Up_File에 삽입
      // Lost_Content부분에 있는 태그들 자르기
      vo.setLost_Content(vo.getLost_Content().replaceAll("<(/)?([a-zA-Z]*)(\\\\s[a-zA-Z]*=[^>]*)?(\\\\s)*(/)?>", ""));
      String replace1 = vo.getLost_Content().replaceAll("<(/)?([a-zA-Z]*)(\\\\s[a-zA-Z]*=[^>]*)?(\\\\s)*(/)?>", "");
      String replace2 = replace1.replaceAll("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>", "");

      vo.setLost_Content(replace2);
      System.out.println("업데이트 vo2 " + vo);
      itemService.update_data(vo);
      System.out.println("업데이트 vo3 " + vo);
      return "redirect:/item";
   }

}