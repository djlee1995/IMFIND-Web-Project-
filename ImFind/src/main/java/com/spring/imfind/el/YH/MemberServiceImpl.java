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

	@Override
	public int CheckID(String id) {
		
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		int count = memberMapper.checkID(id);
		int state = 0;
		
		if(count == 0) {
			state = 1;
		}
		else {
			state = -1;
		}
		
		return state;
	}

	@Override
	public int insertMember(MemberVO vo) {
			
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		Integer state = memberMapper.insertMember(vo);
		System.out.println(state);
		System.out.println(vo.toString());
		return 0;
	}

	@Override
	public String findID(String name, String email) {
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		String state = memberMapper.findID(name, email);
		return state;
	}
	@Override
	public MemberVO findPW(String id, String email) {
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		MemberVO vo = memberMapper.findPW(id, email);
		return vo;
	}

	@Override
	public int alterTempPW(String id, String pw) {
		int state = -1;
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		state = memberMapper.alterTempPW(id, pw);
		System.out.println("statÀÔ´Ï´Ù " + state);
		return state;
	}
	

}