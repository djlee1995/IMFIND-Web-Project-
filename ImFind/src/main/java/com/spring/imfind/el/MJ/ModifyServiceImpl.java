package com.spring.imfind.el.MJ;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.spring.imfind.el.EJ.MemberVO;
import com.spring.imfind.el.YH.LoginDTO;
import com.spring.mapper.MJ.ModifyMapper;

@Service("modifyService")
public class ModifyServiceImpl implements ModifyService {
	@Autowired
	private SqlSession sqlSession;
	ModifyMapper mapper = null;

	@Override
	public MemberVO getMember(String id) {
		ModifyMapper mapper = sqlSession.getMapper(ModifyMapper.class);
		MemberVO vo = mapper.getMember(id);
		return vo;
	}

	@Override
	public int updateMember(LoginDTO vo) {
		ModifyMapper mapper = sqlSession.getMapper(ModifyMapper.class);
		int result = mapper.updateMember(vo);
		return result;
	}

}