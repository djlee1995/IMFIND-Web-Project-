
package com.spring.imfind.el.MJ;

import java.io.File;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.spring.imfind.el.EJ.PetVO;

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

	// 좋아요 기능
	@ResponseBody
	@RequestMapping(value = "/likeChk", produces = "application/json;charset=UTF-8")
	public List<ItemVO> likeChk() {

		List<ItemVO> list = itemService.likeChk();
		return list;
	}

	@ResponseBody
	@RequestMapping(value = "/likeCount", produces = "application/json;charset=UTF-8")
	public int likeCount(@RequestParam(value = "lost_PostNum") int lost_PostNum) {

		int res = itemService.likeCount(lost_PostNum);

		return res;
	}

	@ResponseBody
	@RequestMapping(value = "/likeplus", produces = "application/json;charset=UTF-8")
	public int likeplus(@RequestParam(value = "lost_PostNum") int lost_PostNum, @RequestParam(value = "id") String id) {
		int res = itemService.like_plus(lost_PostNum, id);
		return res;
	}

	@ResponseBody
	@RequestMapping(value = "/likecancel", produces = "application/json;charset=UTF-8")
	public int likecancel(@RequestParam(value = "lost_PostNum") int lost_PostNum,
			@RequestParam(value = "id") String id) {
		int res = itemService.like_cancel(lost_PostNum, id);
		return res;
	}

	// 좋아요 기능 (pet)
	@ResponseBody
	@RequestMapping(value = "/pet_likeChk", produces = "application/json;charset=UTF-8")
	public List<ItemVO> pet_likeChk() {

		List<ItemVO> list = itemService.likeChk();
		return list;
	}

	@ResponseBody
	@RequestMapping(value = "/pet_likeCount", produces = "application/json;charset=UTF-8")
	public int pet_likeCount(@RequestParam(value = "Pet_PostNum") int Pet_PostNum) {

		int res = itemService.pet_likeCount(Pet_PostNum);

		return res;
	}

	@ResponseBody
	@RequestMapping(value = "/pet_likeplus", produces = "application/json;charset=UTF-8")
	public int pet_likeplus(@RequestParam(value = "Pet_PostNum") int Pet_PostNum,
			@RequestParam(value = "id") String id) {
		int res = itemService.pet_like_plus(Pet_PostNum, id);
		return res;
	}

	@ResponseBody
	@RequestMapping(value = "/pet_likecancel", produces = "application/json;charset=UTF-8")
	public int pet_likecancel(@RequestParam(value = "Pet_PostNum") int Pet_PostNum,
			@RequestParam(value = "id") String id) {
		int res = itemService.pet_like_cancel(Pet_PostNum, id);
		return res;
	}

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
		return list;
	}

	@RequestMapping(value = "/sido.do", produces = "application/json; charset=utf-8")
	@ResponseBody
	public List<ItemVO> sido(@RequestParam(value = "lost_Loc", required = false) String lost_Loc) {
		List<ItemVO> list = itemService.getSido(lost_Loc);
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
		Pattern pattern = Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>"); // 이미지태그 자르기
		String content = vo.getLost_Content();
		Matcher match = pattern.matcher(content);
		String Lost_Up_File = null;
		String uploadPath = "C:\\Project\\WebProject\\upload\\";
		// String uploadPath = "/Users/hongmac/Documents/upload/";

		if (match.find()) {
			Lost_Up_File = match.group(0);
			vo.setLost_Up_File(Lost_Up_File); // 이미지 태그 Lost_Up_File에 삽입

		}
		// Lost_Content부분에 있는 태그들 자르기
		if (vo.getLost_Up_File() == null) {
			String noimg = "0";
			vo.setLost_Up_File(noimg);

		}
		// Lost_Content부분에 있는 태그들 자르기
		vo.setLost_Content(vo.getLost_Content().replaceAll("<(/)?([a-zA-Z]*)(\\\\s[a-zA-Z]*=[^>]*)?(\\\\s)*(/)?>", ""));
		String replace1 = vo.getLost_Content().replaceAll("<(/)?([a-zA-Z]*)(\\\\s[a-zA-Z]*=[^>]*)?(\\\\s)*(/)?>", "");
		String replace2 = replace1.replaceAll("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>", "");
		// String replace4 = boardvo.getLost_Item().replaceAll("있음,", ""); // name
		vo.setLost_Content(replace2);

		// boardvo.setLost_Item(replace4);

		itemService.update_data(vo);

		return "redirect:/item";
	}

	// Pet
	@RequestMapping("/pet")
	public String pet() {
		return "el/MJ/pet";
	}

	@RequestMapping("/petinfo")
	public String petinfo() {
		return "el/MJ/petinfo";
	}

	@RequestMapping("/petupdatepage")
	public String petupdatepage() {
		return "el/MJ/updatepet";
	}

	@RequestMapping("/petupdate.do")
	public String petupdate_data(PetVO vo) {
		Pattern pattern = Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>"); // 이미지태그 자르기
		String content = vo.getPet_Content();
		Matcher match = pattern.matcher(content);
		String Lost_Up_File = null;
		String uploadPath = "C:\\Project\\WebProject\\upload\\";
		// String uploadPath = "/Users/hongmac/Documents/upload/";

		if (match.find()) {
			Lost_Up_File = match.group(0);
			vo.setPet_Up_File(Lost_Up_File); // 이미지 태그 Lost_Up_File에 삽입

		}
		// Lost_Content부분에 있는 태그들 자르기
		if (vo.getPet_Up_File() == null) {
			String noimg = "0";
			vo.setPet_Up_File(noimg);

		}
		// Lost_Content부분에 있는 태그들 자르기
		vo.setPet_Content(vo.getPet_Content().replaceAll("<(/)?([a-zA-Z]*)(\\\\s[a-zA-Z]*=[^>]*)?(\\\\s)*(/)?>", ""));
		String replace1 = vo.getPet_Content().replaceAll("<(/)?([a-zA-Z]*)(\\\\s[a-zA-Z]*=[^>]*)?(\\\\s)*(/)?>", "");
		String replace2 = replace1.replaceAll("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>", "");
		// String replace4 = boardvo.getLost_Item().replaceAll("있음,", ""); // name
		vo.setPet_Content(replace2);

		// boardvo.setLost_Item(replace4);

		itemService.petupdate_data(vo);

		return "redirect:/pet";
	}

	@RequestMapping(value = "/petdeletepage", produces = "application/json;charset=UTF-8")
	public String petdeletepage(@RequestParam(value = "Pet_PostNum") int Pet_PostNum) {
		itemService.petdelete_data(Pet_PostNum);
		return "redirect:/pet";
	}

	@ResponseBody
	@RequestMapping(value = "/petlist.do", produces = "application/json;charset=UTF-8")
	public List<PetVO> pet(PetVO vo) {
		List<PetVO> list = itemService.getPetservice(vo);
		return list;
	}

	@ResponseBody
	@RequestMapping(value = "/petsearch.do", produces = "application/json;charset=UTF-8")
	public List<PetVO> petlist(@RequestParam(value = "Pet_Title") String Pet_Title) {
		List<PetVO> list = itemService.getPetservice(Pet_Title);
		return list;
	}

	@RequestMapping(value = "/petsido.do", produces = "application/json; charset=utf-8")
	@ResponseBody
	public List<PetVO> petsido(@RequestParam(value = "Pet_Loc", required = false) String Pet_Loc) {
		List<PetVO> list = itemService.getPetSido(Pet_Loc);
		return list;
	}

	@ResponseBody
	@RequestMapping(value = "/petdatainfo.do", produces = "application/json;charset=UTF-8")
	public List<PetVO> petdatainfo(@RequestParam(value = "Pet_PostNum") int Pet_PostNum) {
		List<PetVO> list = itemService.getpetdata_info(Pet_PostNum);
		return list;
	}

	// 사례금 랭크
	@ResponseBody
	@RequestMapping(value = "/lost_pay_rank.do", produces = "application/json;charset=UTF-8")
	public List<ItemVO> lost_pay_rank(ItemVO vo) {
		List<ItemVO> list = itemService.lost_pay_rank(vo);
		return list;
	}

	// 사례금 랭크(pet)
	@ResponseBody
	@RequestMapping(value = "/pet_pay_rank.do", produces = "application/json;charset=UTF-8")
	public List<PetVO> pet_pay_rank(PetVO vo) {
		List<PetVO> list = itemService.pet_pay_rank(vo);
		return list;
	}

	// 좋아요 랭크
	@ResponseBody
	@RequestMapping(value = "/lost_like_rank.do", produces = "application/json;charset=UTF-8")
	public List<ItemVO> lost_like_rank() {
		List<ItemVO> list = itemService.lost_like_rank();
		return list;
	}

	// 좋아요 랭크(pet)
	@ResponseBody
	@RequestMapping(value = "/pet_like_rank.do", produces = "application/json;charset=UTF-8")
	public List<PetVO> pet_like_rank() {
		List<PetVO> list = itemService.pet_like_rank();
		return list;
	}
}
