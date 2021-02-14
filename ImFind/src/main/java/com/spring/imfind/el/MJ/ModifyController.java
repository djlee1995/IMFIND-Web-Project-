package com.spring.imfind.el.MJ;

import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.spring.imfind.el.EJ.MemberVO;
import com.spring.imfind.el.YH.LoginDTO;

@Controller
public class ModifyController {
	@Autowired
	private ModifyService modifyService;
	HttpSession session;

	@RequestMapping("/modify")
	public ModelAndView modify(ModelAndView modelandview, HttpServletRequest request) {
		session = request.getSession();
		String id = (String) session.getAttribute("loginUser");
		MemberVO vo = modifyService.getMember(id);
		modelandview.setViewName("./el/MJ/modify");
		modelandview.addObject("membervo", vo);
		return modelandview;
	}

	@RequestMapping(value = "modify.do", produces = "application/json; charset=UTF-8")
	public String myinfo_update(LoginDTO dto) {
		Map<String, String> result = new HashMap<String, String>();
		dto.setAccount_holder(dto.getName());
		int res = modifyService.updateMember(dto);
		if (res == 1) {
			return "el/YS/mypage";
		} else {
			return "register";
		}
	}

}