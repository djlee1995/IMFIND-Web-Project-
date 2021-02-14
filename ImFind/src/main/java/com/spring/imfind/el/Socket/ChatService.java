
package com.spring.imfind.el.Socket;

import com.spring.imfind.el.EJ.BoardVO;

public interface ChatService {
	public int createChatRoom(ChatDTO dto);

	public ChatDTO chkRoomExist(int postnum, String sender, String receiver);

	public BoardVO getBoardInfo(ChatDTO dto);
}
