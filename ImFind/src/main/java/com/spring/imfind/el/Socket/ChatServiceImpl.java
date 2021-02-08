
package com.spring.imfind.el.Socket;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.imfind.el.EJ.BoardVO;
import com.spring.mapper.YH.ChatMapper;

@Service("chatService")
public class ChatServiceImpl implements ChatService {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public int createChatRoom(ChatDTO dto) {
		ChatMapper chatMapper = sqlSession.getMapper(ChatMapper.class);
		Integer res = chatMapper.createChatRoom(dto);
		return res;
	}

	@Override
	public ChatDTO chkRoomExist(int postnum, String sender, String receiver) {

		ChatMapper chatMapper = sqlSession.getMapper(ChatMapper.class);
		ChatDTO dto = chatMapper.chkRoomExist(postnum, sender, receiver);
		return dto;
	}

	@Override
	public BoardVO getBoardInfo(ChatDTO dto) {
		ChatMapper chatMapper = sqlSession.getMapper(ChatMapper.class);
		BoardVO vo = chatMapper.getBoardInfo(dto);
		return vo;
	}

}
