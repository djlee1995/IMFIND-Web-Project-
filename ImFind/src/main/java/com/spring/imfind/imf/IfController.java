package com.spring.imfind.imf;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class IfController {
	@Autowired
	private LostService lostService;
	
	@RequestMapping(value = "/index.if", method = RequestMethod.GET)
	public String home() {
		return "if/index";
	}

	@RequestMapping(value = "/place.if", produces="application/json; charset=utf-8")
	@ResponseBody
	public List<LostVO> place() {
		System.out.println("AAAAAAAAAAA");
		List<LostVO> place = lostService.place();
		System.out.println("place="+place.size());
		return place;
	}
	@RequestMapping(value = "/lostlist.if", produces="application/json; charset=utf-8")
	@ResponseBody
	public List<LostVO> lostlist(@RequestParam(value = "placeid" , required = false)String placeid) {
		System.out.println("BBBBBBBBBB");
		List<LostVO> lostlist = lostService.lostlist(placeid);
		System.out.println("lostlist="+lostlist.size());
		return lostlist;
	}
	
}
