package com.spring.imfind.el;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.imfind.el.EJ.BoardService;
import com.spring.imfind.el.EJ.BoardVO;

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
	public String shop() {
		
		return "el/EJ/itemboard";
	}
	
	
	@RequestMapping("/itemInsert")
	public String itemInsert(BoardVO vo){
		System.out.println("in");
		boardService.itemInsert(vo);
		System.out.println(vo.toString());
		
		
		return "el/index";
	}
	
	
	
	/*
	@RequestMapping("/map.html")
	public String map() {

		return "map";
	}
	*/
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