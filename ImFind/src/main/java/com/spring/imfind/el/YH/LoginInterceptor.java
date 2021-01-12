package com.spring.imfind.el.YH;


import javax.servlet.http.Cookie;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.StringUtils;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.spring.imfind.HomeController;

public class LoginInterceptor extends HandlerInterceptorAdapter implements SessionName {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		

        logger.info("LoginInterceptor - {}", "ȣ��Ϸ�");
        
		HttpSession session = request.getSession();
		Object user = session.getAttribute(LOGIN);
		
		if(session.getAttribute(LOGIN) != null) {
			session.removeAttribute(LOGIN);
		}
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		

        logger.info("LoginInterceptor - {}", "ȣ��Ϸ�");
        
		HttpSession session = request.getSession();
		Object loginUser =  request.getSession().getAttribute(LOGIN);
		
		if(loginUser != null) {

			System.out.println("�α����� ���� : " + (String)loginUser);
			
			// ��й�ȣ ��� ���� �� ��Ű ����
			if(!(StringUtils.isEmpty(request.getParameter("savePass")))) {
				Cookie loginCookie = new Cookie(LOGIN_COOKIE, session.getId());
				loginCookie.setPath("/imfind");
				loginCookie.setMaxAge(1 * 24 * 60 * 60); // 24�ð� ���� ��Ű ����
				
				response.addCookie(loginCookie);
			}
		}
		super.postHandle(request, response, handler, modelAndView);

	}
	
}
