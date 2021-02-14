
package com.spring.imfind.el.YH;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class KakaoLoginInterceptor extends HandlerInterceptorAdapter implements SessionName {

	private static final Logger logger = LoggerFactory.getLogger(KakaoLoginInterceptor.class);

	@Autowired
	private MemberService memberService;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		logger.info("KakaoLoginInterceptor - {}", "kakao prehandle");

		HttpSession session = request.getSession();
		Object kakaoUser = session.getAttribute(KAKAO_LOGIN);

		if (kakaoUser != null) {
			session.removeAttribute(KAKAO_LOGIN);
		}
		return super.preHandle(request, response, handler);
	}

	/*
	 * 카카오 로그인 - ȸ에 회원정보 없으면 register 화면으로 이동한다.
	 */

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

		logger.info("KakaoLoginInterceptor - {}", "kakao posthandle in");

		HttpSession session = request.getSession();
		Object kakaoLoginUser = request.getSession().getAttribute(KAKAO_LOGIN);

		if (kakaoLoginUser != null) {

			int res = memberService.kakaoLoginCheck((String) kakaoLoginUser);
			if (res == 1) {
				logger.info("KakaoLoginInterceptor - {}", "DB에 회원정보 있는 카카오 로그인 사용자.");

				LoginDTO dto = memberService.getLoginDTO((String) kakaoLoginUser);
				session.setAttribute(MEMBERINFO, dto);

				return;

			}
		}
	}
}
