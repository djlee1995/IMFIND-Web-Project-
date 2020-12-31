package com.spring.imfind.el;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.imfind.el.YS.ElService;
import com.spring.imfind.el.YS.ElVO;

@Controller
public class ElController {
	
	@Autowired
	private ElService elService;
	
	//soo: views ���������� el ������ �ٷ� mypage�� �ִ°� �ƴ϶�. YS������ �����ؼ� ��ġ �̵��ؼ� ������. (12/31_1305)
		@RequestMapping("/mypage")
		public String mypage() {
			
			return "el/YS/mypage";
		}
		
		@RequestMapping(value="/getElsedata",
				 method=RequestMethod.POST,
				 produces="application/json;charset=UTF-8")
		 
		
		@ResponseBody//jsp�� ���� �並 ���� �ϴ� �� �ƴ� �����͸� ���� �ϱ� ���� ��� 
	
				 public List<ElVO> getElsedata() {
				
				//List<EmpVO> list =empService.getEmpEx();
				List<ElVO> list =elService.getElsedata();
				System.out.println("list"+list );
				return list;
			}
		
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
}