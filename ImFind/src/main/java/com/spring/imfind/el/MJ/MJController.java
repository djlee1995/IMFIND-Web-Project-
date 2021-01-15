package com.spring.imfind.el.MJ;

import java.util.List;

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

	/*
	 * 
	 * 민정 - 게시판 조회
	 * 
	 */
	@ResponseBody
	@RequestMapping(value = "/list.do", produces = "application/json;charset=UTF-8")
	public List<ItemVO> item(ItemVO vo) {
		// System.out.println("ininininin");

		// System.out.println(vo.getLost_PostNum());

		List<ItemVO> list = itemService.getItemservice(vo);
		System.out.println("data" + list);

		return list;
	}

	
	  @ResponseBody
	  @RequestMapping(value ="/search.do" ,
	  produces="application/json;charset=UTF-8")
	  public List<ItemVO> list(@RequestParam(value="lost_Title")String lost_Title) {
	  
	  	System.out.println("떠라");
	
	  
	  List<ItemVO> list = itemService.getItemservice(lost_Title);
	  System.out.println("list" + list);
	  
	  
	  return list;
	  
	  }
	  @RequestMapping(value = "/sido.do", produces="application/json; charset=utf-8")
		@ResponseBody
		public List<SelectVO> sido(@RequestParam(value = "sido" , required = false)String sido,@RequestParam(value = "gu" , required = false)String gu,
				@RequestParam(value = "dong" , required = false)String dong) {
			System.out.println("CCCCCCCCCC");
			System.out.println("city"+sido);
			System.out.println("gu"+gu);
			System.out.println("dong"+dong);
			List<SelectVO> list = itemService.getSido(sido, gu, dong);
		
			return list;
		}
	  
	  @ResponseBody
	  @RequestMapping(value ="/datainfo.do" ,
	  produces="application/json;charset=UTF-8")
	  public List<ItemVO> datainfo(@RequestParam(value="lost_PostNum")int lost_PostNum) {
	  System.out.println(lost_PostNum);
	  	System.out.println("떠라");

	  List<ItemVO> list = itemService.getdata_info(lost_PostNum);
	  System.out.println("list" + list);
	  return list;
	  
	  }
	  

		
	}