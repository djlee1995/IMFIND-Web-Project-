package com.spring.imfind.el.YH;

import org.springframework.stereotype.Service;

@Service
public interface MemberService {
	
	public int loginCheck(String id, String pw);
	public int kakaoLoginCheck(String id);
	public int CheckID(String id);
	public int insertMember(MemberVO vo);
	public String findID(String name, String email);
	public MemberVO findPW(String id, String email);
	public int alterTempPW(String id, String pw);
	
}