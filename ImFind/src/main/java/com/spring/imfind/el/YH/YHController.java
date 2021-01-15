package com.spring.imfind.el.YH;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class YHController {
	
	@RequestMapping("/NewHeader_CSS")
	public String NewHeader_CSS() { return "el/NewHeader_CSS"; }

	@RequestMapping("/NewFooter_JS")
	public String NewFooter_JS() { return "el/NewFooter_JS"; }
	
	
	
}
