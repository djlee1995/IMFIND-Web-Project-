package com.spring.imfind.el;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.imfind.el.MJ.ItemService;
import com.spring.imfind.el.MJ.ItemVO;

@Controller
public class ElController {
	
	
	@Autowired
	private ItemService itemService;
	
	@RequestMapping("/index")
	public String index2() {
		
		return "el/index";
	}
	
	@RequestMapping("/login")
	public String login() {
		
		return "el/login";
	}
	
	@RequestMapping("/shop")
	public String shop() {
		
		return "el/shop";
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
	
	// MJ Item 조회게시판
	
	@RequestMapping("/item")
	public String item() {
		
		return "el/MJ/item";
	}
	@ResponseBody
	@RequestMapping(value ="/test.do" ,  produces="application/json;charset=UTF-8")
	public List<ItemVO> test(ItemVO vo) {
		// System.out.println("ininininin");
		
		// System.out.println(vo.getLost_PostNum());
		 
		 
		
		List<ItemVO> list = itemService.getItemservice(vo);
		System.out.println("data"+list);
		
		return list;
	}
	
	
	
	
	

}