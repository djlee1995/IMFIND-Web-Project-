package com.spring.imfind.imf;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.LostMapper;

@Service("LostService")
public class LostServiceImpl implements LostService {
	@Autowired
	private SqlSession sqlSession;

	/*
	 * @Override public List<LostVO> getMembers() { List<LostVO> member_list = null;
	 * EmpMapper memberMapper = sqlSession.getMapper(EmpMapper.class); member_list =
	 * memberMapper.getMembers(); return member_list; }
	 */
	@Override
	public List<LostVO> place() {
		List<LostVO> place = null;
		LostMapper lostMapper = sqlSession.getMapper(LostMapper.class);
		place = lostMapper.place();
		return place;
	}
	
	@Override
	public List<LostVO> lostlist(String placeid) {
		List<LostVO> lostlist = null;
		LostMapper lostMapper = sqlSession.getMapper(LostMapper.class);
		lostlist = lostMapper.lostlist(placeid);
		return lostlist;
	}




}
