package com.spring.imfind.el.YH;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class KakaoLoginInterceptor extends HandlerInterceptorAdapter implements SessionName {
	
	@Autowired
	private MemberService memberService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		Object kakaoUser = session.getAttribute(KAKAO_LOGIN);
		
		if(kakaoUser != null) {
			session.removeAttribute(KAKAO_LOGIN);
		}
		return super.preHandle(request, response, handler);
	}

	/*
	 * 회원정보가 없는 카카오 로그인 사용자는 register 페이지로 이동한다.
	 * */
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		HttpSession session = request.getSession();
		Object kakaoLoginUser =  request.getSession().getAttribute(KAKAO_LOGIN);
		
		if(kakaoLoginUser != null) {
			
			System.out.println("로그인한 유저 : " + (String)kakaoLoginUser);
			
			int res = memberService.kakaoLoginCheck((String)kakaoLoginUser);
			if(res != 1) {
				response.sendRedirect("/imfind/kakaoRegister");
				super.postHandle(request, response, handler, modelAndView);
			}
		}
		super.postHandle(request, response, handler, modelAndView);
	}


}
