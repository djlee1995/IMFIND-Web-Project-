
package com.spring.imfind.el.Socket;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

import com.spring.imfind.el.YH.SessionName;

public class HandShakeInterceptor extends HttpSessionHandshakeInterceptor implements SessionName {

	// 클라이언트에서 웹 소켓 생성. /웹 소켓으로 통신을 하려면 변환 작업이 필요하다 : handshakeInterceptor가 해준다.
	public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wshandler,
			Map<String, Object> map) throws Exception {

		// 위의 파라미터 중, attribute에 값을 저장하면 웹소켓 핸들러 클래스의 webSocketSession에 전달된다.
		System.out.println("Before Handshake");

		ServletServerHttpRequest ssreq = (ServletServerHttpRequest) request;
		System.out.println("URI : " + request.getURI());
		HttpServletRequest req = ssreq.getServletRequest();
		
		try {
			String loginuser = (String) req.getSession().getAttribute(LOGIN);
			map.put(LOGIN, loginuser);
		}
		catch(Exception e) {
			System.out.println("미로그인");
		}

		// handler가 필요한 정보는 map을 통해 전달
		return super.beforeHandshake(request, response, wshandler, map);
	}

	public void afterHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wdhandler,
			Exception ex) {

		System.out.println("After Handshake");
		super.afterHandshake(request, response, wdhandler, ex);
	}

}
