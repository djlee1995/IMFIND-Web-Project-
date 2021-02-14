
package com.spring.imfind.el.Socket;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import org.springframework.util.StringUtils;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.spring.imfind.el.YH.SessionName;

public class FinderChatHandler extends TextWebSocketHandler implements SessionName {

	private Set<WebSocketSession> sessionSet = new HashSet<WebSocketSession>();
	Map<String, WebSocketSession> userSessions = new HashMap<>();

	public FinderChatHandler() {
		super();
	}

	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		super.afterConnectionClosed(session, status);
		sessionSet.remove(session);
	}

	// 핸드쉐이킹 후 자동 호출
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {

		super.afterConnectionEstablished(session);
		System.out.println("afterConnectionEstablished : " + session);

		String senderId = getId(session);

		sessionSet.add(session);
		userSessions.put(senderId, session);
	}

	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {

		super.handleMessage(session, message);

		String senderId = getId(session);

		// handshake에서 저장한 정보
		Map<String, Object> map = session.getAttributes();
		String user = (String) map.get(LOGIN);

		// broadcasting
		for (WebSocketSession client_session : this.sessionSet) {
			if (client_session.isOpen()) {
				try {
					client_session.sendMessage(message);
					System.out.println(message);
					System.out.println(message.getPayload());
				} catch (Exception ignored) {
					System.out.println("fail to send message! " + ignored);
				}
			}
		}

		String msg = (String) message.getPayload();
		// protocol : sender, 게시글 작성자, 게시글 번호
		if (!(StringUtils.isEmpty(msg))) {
			String[] strs = msg.split(",");
			String cmd = strs[0];

			/*
			 * if(strs != null && strs.length == 4)
			 */
		}

	}

	private String getId(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		User loginUser = (User) httpSession.get(SessionName.LOGIN);

		// login user 있을 경우, 없을 경우
		if (null == loginUser) {
			return session.getId();
		} else {
			return session.getId();
		}
	}

	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		System.out.println("web socket error ! : " + exception);
	}

	// 긴 메세지는 짤라서 보내야한다. 이를 지원할지 여부.
	public boolean supportsPartialMessage() {
		System.out.println("call method!");
		return false;
	}

}
