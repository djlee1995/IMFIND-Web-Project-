
package com.spring.imfind;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.imfind.el.EJ.BoardVO;
import com.spring.imfind.el.MJ.IndexLostPostDTO;
import com.spring.imfind.el.MJ.ItemService;
import com.spring.imfind.imf.LostService;
import com.spring.imfind.imf.PoliceVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@Autowired
	LostService lostService;
	@Autowired
	ItemService itemService;

	@RequestMapping(value = "home.do", method = RequestMethod.GET)
	public String home(ModelAndView modelAndView) { return "home2";}
	
	@RequestMapping(value="getNearXY")
	public @ResponseBody Map<String, Object> listByRadius(@RequestParam("x") String x, @RequestParam("y") String y){

		List<PoliceVO> vo = lostService.getSimpleList(x, y);
		List<BoardVO> boardVO;
		for (PoliceVO policeVO : vo) { 
			System.out.println(policeVO.toString());
			try { String[] info = policeVO.getInfo().split("분실하신"); policeVO.setInfo(info[0]); }
			catch(Exception e) { continue; } 
		}
		
		List<IndexLostPostDTO> itemVO = itemService.getItembyDate();
		for (IndexLostPostDTO policeVO : itemVO) { 
			System.out.println(policeVO.toString());
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("police", vo);
		map.put("item", itemVO);
		
		return map;

	}
	@RequestMapping(value = "police", method = RequestMethod.GET)
	   public String police() { 
	      return "police";
    }
}
