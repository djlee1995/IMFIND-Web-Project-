
package com.spring.imfind.el.Socket;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.spring.imfind.el.YH.AlarmDTO;
import com.spring.imfind.el.YH.AlarmService;
import com.spring.imfind.el.YH.SessionName;

public class replyEchoHandler extends TextWebSocketHandler implements SessionName {
	
	@Autowired
	private AlarmService alarmService;

	private Set<WebSocketSession> sessionSet = new HashSet<WebSocketSession>();
	Map<String, WebSocketSession> userSessions = new HashMap<>();

	public replyEchoHandler() {
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

		sessionSet.add(session);

		String user = getId(session);
		System.out.println("로그인한 유저입니다 " + user + session);
		userSessions.put(user, session);

	}

	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {

		super.handleMessage(session, message);

		super.handleMessage(session, message);

		// handshake에서 저장한 정보
		Map<String, Object> map = session.getAttributes();
		System.out.println("핸들 메세지에서 getId 세션 출력하기" + getId(session) + " : " + userSessions.get(getId(session)));
		
		String msg = (String) message.getPayload();
		
		if (!(StringUtils.isEmpty(msg))) {
			String[] strs = msg.split("&");
			
			if (strs != null && strs.length == 4) {
				String bno = strs[0];
				String bw = strs[1];
				String commnet = strs[2];
				String cw = strs[3];
				
				
				WebSocketSession boardWriterSession = userSessions.get(cw.split("=")[1]);
				if (boardWriterSession != null) {
					bno = bno.replace("L", "l");
					String txt = bw.split("=")[1] + "님이 게시글에 댓글을 달았습니다! <a href=\"./iteminfo?"+ bno+"\">이동하기</a>";
					System.out.println(txt);
					
					AlarmDTO alarm = new AlarmDTO();
					alarm.setId(cw.split("=")[1]);
					alarm.setSender(bw.split("=")[1]);
					alarm.setAlarm_content(txt);
					alarm.setPostNum(Integer.parseInt(bno.split("=")[1]));
					alarmService.insertAlarm(alarm);
					
					TextMessage tmpMsg = new TextMessage(txt);
					boardWriterSession.sendMessage(tmpMsg);
				}
			
			}
		}
		
		
		/*
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
		*/
	}

	private String getId(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		String loginUser = (String) httpSession.get(SessionName.LOGIN);

		if (null == loginUser)
			return session.getId();
		else
			return loginUser;
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
