package com.iu.home.chat;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Component
public class ChatHandler extends TextWebSocketHandler {
//	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	HashMap<String, WebSocketSession> sessionMap = new HashMap<String, WebSocketSession>();
	
	
	 // 클라이언트에서 접속을 하여 성공할 경우 발생하는 이벤트
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		super.afterConnectionEstablished(session);
		sessionMap.put(session.getId(), session);
		// 채팅방에 접속한 사용자 세션을 리스트에 저장
//		sessionList.add(session);
//		// 모든 세션에 채팅 전달
//		for (int i = 0; i < sessionList.size(); i++) {
//			WebSocketSession s = sessionList.get(i);
//		
//			s.sendMessage(new TextMessage(/*session.getId() + */"님이 입장 했습니다."));
//		}
	}

	// 클라이언트에서 send를 이용해서 메시지 발송을 한 경우 이벤트 핸들링
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		String msg = message.getPayload();
		for(String key : sessionMap.keySet()) {
			WebSocketSession wss = sessionMap.get(key);
				wss.sendMessage(new TextMessage(msg));
		}
//		// 모든 세션에 채팅 전달
//		for (int i = 0; i < sessionList.size(); i++) {
//			WebSocketSession s = sessionList.get(i);
//			s.sendMessage(new TextMessage(/*session.getId() + " : " + */message.getPayload()));
//		}
	}

	// 클라이언트에서 연결을 종료할 경우 발생하는 이벤트
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessionMap.remove(session.getId());
		super.afterConnectionClosed(session, status);
		
		
//		// 채팅방에서 퇴장한 사용자 세션을 리스트에서 제거
//		sessionList.remove(session);
//
//		// 모든 세션에 채팅 전달
//		for (int i = 0; i < sessionList.size(); i++) {
//			WebSocketSession s = sessionList.get(i);
//			s.sendMessage(new TextMessage(/*session.getId() + */"님이 퇴장 했습니다."));
//		}

	}

}
