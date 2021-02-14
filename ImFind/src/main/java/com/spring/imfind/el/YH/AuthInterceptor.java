
package com.spring.imfind.el.YH;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthInterceptor extends HandlerInterceptorAdapter implements SessionName {

	@Autowired
	MemberService memberService;

	private static final Logger logger = LoggerFactory.getLogger(AuthInterceptor.class);

	private void saveDestination(HttpServletRequest req) {
		logger.info("AuthInterceptor - {}", "페이지 접근 권한 처리 - 사용자 목적지 저장");

		String uri = req.getRequestURI();
		String query = req.getQueryString();


		if (query == null || query.equals("null")) {
			query = "";
		} else {
			query = "?" + query;
		}
		if (req.getMethod().equals("GET")) {
			logger.info("dest: " + (uri + query));
			req.getSession().setAttribute(DESTINATION, uri + query);
		}
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		logger.info("AuthInterceptor - {}", "페이지 접근 권한 처리 pre Handle");

		HttpSession session = request.getSession();

		String kakaoUser = (String) session.getAttribute(KAKAO_LOGIN);
		int res = 0;
		if (kakaoUser != null) {
			res = memberService.kakaoLoginCheck(kakaoUser);
		}
 
		if (kakaoUser != null && res != 1) {

			logger.info("KakaoLoginInterceptor - {}", "DB에 회원정보 없는 카카오 로그인 사용자는 회원정보등록 페이지로 이동한다.");
			response.sendRedirect("./kakaoRegister");
			return false;
			
		} else if (session.getAttribute(LOGIN) == null) {

			logger.info("current user is not logined");
			saveDestination(request);
			// 로그인하지 않은 사용자일 경우 로그인 페이지로 이동
			response.sendRedirect("./login");
			return false;
		}
		// 로그인한 사용자일 경우 Controller 호출
		return true;
	}

}
