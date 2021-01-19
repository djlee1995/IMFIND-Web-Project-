<<<<<<< HEAD
package com.spring.imfind.el.YH;

import org.springframework.stereotype.Service;

@Service
public interface MemberService {
	
	public int loginCheck(String id, String pw);
	public int kakaoLoginCheck(String id);
	public int CheckID(String id);
	public int insertMember(LoginDTO vo);
	public String findID(String name, String email);
	public LoginDTO findPW(String id, String email);
	public int alterTempPW(String id, String pw);
	
=======
package com.spring.imfind.el.YH;

import org.springframework.stereotype.Service;

@Service
public interface MemberService {
	
	public int loginCheck(String id, String pw);
	public int kakaoLoginCheck(String id);
	public int CheckID(String id);
	public int insertMember(LoginDTO vo);
	public String findID(String name, String email);
	public LoginDTO findPW(String id, String email);
	public int alterTempPW(String id, String pw);
	public LoginDTO getLoginDTO(String id);
>>>>>>> dd989063f89186c6b2e1561ca33d1f1d7ef91ae8
}