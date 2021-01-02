package com.spring.mapper.YH;

import org.apache.ibatis.annotations.Param;

public interface MemberMapper {
	
	public int loginCheck(@Param("id") String id, @Param("pw") String pw);
	public int kakaoLoginCheck(String id);
	
}