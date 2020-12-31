package com.spring.imfind.imf;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IfController {
	
	
	@RequestMapping("index.if")
	public String index2() {
		
		return "if/index";
	}
}
