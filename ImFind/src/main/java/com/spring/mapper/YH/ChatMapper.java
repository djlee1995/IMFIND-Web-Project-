
package com.spring.mapper.YH;

import org.apache.ibatis.annotations.Param;

import com.spring.imfind.el.EJ.BoardVO;
import com.spring.imfind.el.Socket.ChatDTO;

public interface ChatMapper {
	public int createChatRoom(ChatDTO dto);

	public ChatDTO chkRoomExist(@Param("postnum") int postnum, @Param("sender") String sender,
			@Param("reciever") String receiver);

	public BoardVO getBoardInfo(ChatDTO dto);
}
