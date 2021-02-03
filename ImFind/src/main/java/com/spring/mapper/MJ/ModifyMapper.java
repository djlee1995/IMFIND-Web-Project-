
package com.spring.mapper.MJ;

import com.spring.imfind.el.EJ.MemberVO;
import com.spring.imfind.el.YH.LoginDTO;

public interface ModifyMapper {
	MemberVO getMember(String id);

	public int updateMember(LoginDTO vo);

}