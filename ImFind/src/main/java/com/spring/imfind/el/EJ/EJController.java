package com.spring.imfind.el.EJ;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.mail.MessagingException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.WebUtils;

import com.spring.imfind.el.YH.EmailSend;
import com.spring.imfind.el.YH.KakaoController;
import com.spring.imfind.el.YH.LoginDTO;
import com.spring.imfind.el.YH.MemberService;
import com.spring.imfind.el.YH.OpenBanking;
import com.spring.imfind.el.YH.Tempkey;

import com.spring.imfind.el.EJ.BoardService;

@Controller
public class EJController {
	
	@Autowired

	JavaMailSender mailSender;
	
	@Autowired
	EmailSend mailSend;
	
	@Autowired
	private MemberService memberService;

	@Autowired
	private BoardService boardService;
	

	
	@RequestMapping("/index")
	public String index2() { return "el/index"; }
	
	@RequestMapping("/home2")
	public String index3() { return "home2"; }
	

	/*
	 은지 - 게시판 등록 시작
	
	 */
	@RequestMapping("/itemboard")
	public String itemboard() {
		
		return "el/EJ/itemboard";
	}
	
	
	@RequestMapping("/itemInsert")
	public String itemInsert(BoardVO boardvo){
		System.out.println("in");
		boardService.itemInsert(boardvo);
		System.out.println(boardvo.toString());
		
		
		return "el/index";
	}
	
	   @ResponseBody
	   @PostMapping("/profileImage")
	   public void summer_image(MultipartFile file, HttpServletRequest request,
	         HttpServletResponse response) throws Exception {
		   
		   System.out.println("ddddddd");
	      response.setContentType("text/html;charset=utf-8");
	      String uploadPath = "/Users/hongmac/Documents/upload/";
	      //String uploadPath = "/Users/hongmac/Documents/WebProject/ImFind/src/main/webapp/resources/el/images/";
	      
	      
	      PrintWriter out = response.getWriter();
	      String originalFileExtension = file.getOriginalFilename(); 
	      String storedFileName = UUID.randomUUID().toString().replaceAll("-", ""); //+ originalFileExtension

	      System.out.println("storedFileName : " + storedFileName);
	      file.transferTo(new File(uploadPath+storedFileName));
	      out.println("/imfind/upload/"+storedFileName);
	      out.close();

	   }

	
	@RequestMapping(value="el/paymember", method=RequestMethod.POST, produces="application/json;charset=UTF-8")
	@ResponseBody
	public List<MemberVO> getMemberPay(
			@RequestParam(value="id") String id){
		System.out.println("떠라");
		List<MemberVO> list = boardService.getPayMember(id);
		
		System.out.println("list" + list);
		
		return list;
	}
	   
	@RequestMapping(value="el/insertPay", method=RequestMethod.POST, produces="application/json;charset=UTF-8")
	@ResponseBody
	public int insertPay(@RequestBody Map<String, String> vo){
		System.out.println("떠라2222222");
		
		PayVO payVO = new PayVO();
		payVO.setPayCode((vo.get("PayCode")));
		payVO.setPay_Way((vo.get("Pay_Amount")));
		payVO.setPay_Amount(Integer.parseInt(vo.get("Pay_Amount")));
		payVO.setPay_State((vo.get("Pay_State")));
		payVO.setPay_Date((vo.get("Pay_Date")));
		
		int res = boardService.insertPay(payVO);
		System.out.println(res);
		System.out.println("payVO==========" + payVO);
		
		return res;
	}
	
	@RequestMapping("/petboard")
	public String petboard() {
		
		return "el/EJ/petboard";

	}
	
	@RequestMapping("el/petInsert")
	public String petInsert(PetVO petvo){
		System.out.println("in");
		boardService.petInsert(petvo);
		System.out.println(petvo.toString());
		
		
		return "el/index";
	}
	/*
	 은지 - 게시판 등록 끝
	 */
	
	/*
	 은지 댓글 시작 
	 */
	
	@RequestMapping("/comment")
	public String comment() { 
		
		return "el/EJ/comment"; 
	}
	
	@RequestMapping(value = "el/comInsert",
			produces="application/json;charset=UTF-8")
	public int commentInsert(LostComVO lostcomvo) {
		
		System.out.println("댓글 in");
		System.out.println(lostcomvo.toString());
		int res = boardService.commentInsert(lostcomvo);
		
		return res;
	}
	
	@RequestMapping(value="el/commentlist",
			produces="application/json;charset=UTF-8")
	public List<LostComVO> itemCommentList(@RequestParam int Lost_PostNum){
		List<LostComVO> comment_list = boardService.itemCommentList(Lost_PostNum);
		
		return comment_list;
	}
	
	/* 
	  은지 댓글 끝
	 */




}