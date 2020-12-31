package com.spring.imfind.el.YS;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.YS.ElMapper;

@Service("elService")
public class ElServiceImpl implements ElService {
	
	@Autowired
	private SqlSession sqlSession;


	@Override
	public List<ElVO> getElsedata() {
		// TODO Auto-generated method stub
		List<ElVO>elseList=null;
		ElMapper elMapper=sqlSession.getMapper(ElMapper.class);
		elseList=elMapper.getElsedata();
		
		
		
		return elseList;
	}

}
