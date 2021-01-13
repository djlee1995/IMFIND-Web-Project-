package com.spring.imfind.el;

import java.io.File;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.spring.imfind.el.EJ.BoardService;
import com.spring.imfind.el.EJ.BoardVO;
import com.spring.imfind.el.EJ.MemberVO;
import com.spring.imfind.el.EJ.PayVO;
import com.spring.imfind.el.EJ.PetVO;

@Controller
public class ElController {
	
	@Autowired
	private BoardService boardService;

	@RequestMapping("/index")
	public String index2() {
		
		return "el/index";
	}
	
	@RequestMapping("/login")
	public String login() {
		
		return "el/login";
	}
	
	/*
	
	 은지 - 게시판 등록
	
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
	      String storedFileName = UUID.randomUUID().toString().replaceAll("-", "");// + originalFileExtension

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
	
	@RequestMapping("/petInsert")
	public String petInsert(PetVO petvo){
		System.out.println("in");
		boardService.petInsert(petvo);
		System.out.println(petvo.toString());
		
		
		return "el/index";
	}
	/*
	 은지 - 게시판 등록
	 */
	
	// header include 
    @RequestMapping("/header")
    public String header() {

        return "el/header";
    }
    
	@RequestMapping("/collection")
	public String collection() {
		
		return "el/collection";
	}
	
	@RequestMapping("/blog")
	public String blog() {
		
		return "el/blog";
	}
	
	@RequestMapping("/contact")
	public String contact() {
		
		return "el/contact";
	}
	
	@RequestMapping("/shopping-cart")
	public String shoppingcart() {
		
		return "el/shopping-cart";
	}
	
	@RequestMapping("/main")
	public String main() {
		
		return "el/main";
	}
	
	@RequestMapping("/blog-details")
	public String blogdetails() {
		
		return "el/blog-details";
	}
	
	@RequestMapping("/chek-out")
	public String chekout() {
		
		return "el/chek-out";
	}
	
	@RequestMapping("/faq")
	public String faq() {
		
		return "el/faq";
	}
	
	@RequestMapping("/register")
	public String register() {
		
		return "el/register";
	}
	
	
}