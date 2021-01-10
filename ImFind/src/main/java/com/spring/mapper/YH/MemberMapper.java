package com.spring.mapper.YH;

import org.apache.ibatis.annotations.Param;

import com.spring.imfind.el.YH.MemberVO;


public interface MemberMapper {
	
	public int loginCheck(@Param("id") String id, @Param("pw") String pw);
	public int kakaoLoginCheck(String id);
	public int checkID(String id);
	public Integer insertMember(MemberVO vo);
	public String findID(@Param("name") String name, @Param("email") String email);
	public MemberVO findPW(@Param("id") String id, @Param("email") String email);
	public int alterTempPW(@Param("id") String id, @Param("pw") String pw);
}