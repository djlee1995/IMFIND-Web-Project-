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
	public String index() {
		return "if/index";
	}
	@RequestMapping(value = "/etc_index.if", method = RequestMethod.GET)
	public String etc_index() {
		return "if/etc";
	}
	@RequestMapping(value = "/police.if", produces="application/json; charset=utf-8")
	@ResponseBody
	public List<PoliceVO> police() {
		System.out.println("AAAAAAAAAAA");
		List<PoliceVO> police = lostService.police();
		System.out.println("place="+police.size());
		return police;
	}
	@RequestMapping(value = "/p_lostlist.if", produces="application/json; charset=utf-8")
	@ResponseBody
	public List<PoliceVO> p_lostlist(@RequestParam(value = "placeid" , required = false)String placeid) {
		System.out.println("BBBBBBBBBB");
		List<PoliceVO> p_lostlist = lostService.p_lostlist(placeid);
		System.out.println("lostlist="+p_lostlist.size());
		return p_lostlist;
	}
	@RequestMapping(value = "/p_info.if", produces="application/json; charset=utf-8")
	@ResponseBody
	public List<PoliceVO> infodata(@RequestParam(value = "code" , required = false)String code) {
		System.out.println("BBBBBBBBBB");
		List<PoliceVO> p_info = lostService.p_info(code);
		System.out.println("lostlist="+p_info.size());
		return p_info;
	}
	@RequestMapping(value = "/etc.if", produces="application/json; charset=utf-8")
	@ResponseBody
	public List<EtcVO> etc() {
		System.out.println("AAAAAAAAAAA");
		List<EtcVO> et = lostService.etc();
		System.out.println("place="+et.size());
		return et;
	}
	@RequestMapping(value = "/s_lostlist.if", produces="application/json; charset=utf-8")
	@ResponseBody
	public List<EtcVO> s_lostlist(@RequestParam(value = "tel" , required = false)String tel) {
		System.out.println("BBBBBBBBBB");
		List<EtcVO> s_lostlist = lostService.s_lostlist(tel);
		System.out.println("lostlist="+s_lostlist.size());
		return s_lostlist;
	}
	@RequestMapping(value = "/s_info.if", produces="application/json; charset=utf-8")
	@ResponseBody
	public List<EtcVO> s_infodata(@RequestParam(value = "code" , required = false)String code) {
		System.out.println("BBBBBBBBBB");
		List<EtcVO> s_info = lostService.s_info(code);
		System.out.println("lostlist="+s_info.size());
		return s_info;
	}
	
}
