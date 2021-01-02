package com.spring.imfind.el.YH;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.YH.MemberMapper;

@Service("memberService")
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int loginCheck(String id, String pw) {
		
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		int count = memberMapper.loginCheck(id, pw);
		System.out.println("count => " + count);
		
		int state = 0;
		
		if(count == 1) {
			state = 1;
		}
		else {
			state = -1;
		}
		
		return state;
	}

	@Override
	public int kakaoLoginCheck(String id) {
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		int count = memberMapper.kakaoLoginCheck(id);
		return count;
	}
	
	

}