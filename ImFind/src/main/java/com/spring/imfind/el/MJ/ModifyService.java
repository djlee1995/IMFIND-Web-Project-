package com.spring.imfind.el.MJ;

import com.spring.imfind.el.EJ.MemberVO;
import com.spring.imfind.el.YH.LoginDTO;

public interface ModifyService {
	MemberVO getMember(String id);

	public int updateMember(LoginDTO dto);
}