<<<<<<< HEAD
package com.spring.mapper.YH;

import org.apache.ibatis.annotations.Param;

import com.spring.imfind.el.YH.LoginDTO;


public interface MemberMapper {
	
	public int loginCheck(@Param("id") String id, @Param("pw") String pw);
	public int kakaoLoginCheck(String id);
	public int checkID(String id);
	public Integer insertMember(LoginDTO vo);
	public String findID(@Param("name") String name, @Param("email") String email);
	public LoginDTO findPW(@Param("id") String id, @Param("email") String email);
	public int alterTempPW(@Param("id") String id, @Param("pw") String pw);
=======
package com.spring.mapper.YH;

import org.apache.ibatis.annotations.Param;

import com.spring.imfind.el.YH.LoginDTO;


public interface MemberMapper {
	
	public int loginCheck(@Param("id") String id, @Param("pw") String pw);
	public int kakaoLoginCheck(String id);
	public int checkID(String id);
	public Integer insertMember(LoginDTO vo);
	public String findID(@Param("name") String name, @Param("email") String email);
	public LoginDTO findPW(@Param("id") String id, @Param("email") String email);
	public int alterTempPW(@Param("id") String id, @Param("pw") String pw);
	public LoginDTO getLoginDTO(String id);
>>>>>>> dd989063f89186c6b2e1561ca33d1f1d7ef91ae8
}