package com.spring.imfind;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.imfind.imf.LostService;
import com.spring.imfind.imf.PoliceVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired 
	LostService lostService;

	@RequestMapping(value = "home.do", method = RequestMethod.GET)
	public ModelAndView home(ModelAndView modelAndView) {
		
		List<PoliceVO> vo = lostService.getSimpleList();
		System.out.println(vo.toString());
		
		for (PoliceVO policeVO : vo) {
			try {
				String[] info = policeVO.getInfo().split("분실하신");
				policeVO.setInfo(info[0]);
			}
			catch(Exception e) {
				continue;
			}
		}
		 
		modelAndView.addObject("police", vo);
		modelAndView.setViewName("home2");
		
		return modelAndView;
	}
	
}
