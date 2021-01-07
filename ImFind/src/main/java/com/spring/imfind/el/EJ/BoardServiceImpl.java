package com.spring.imfind.el.EJ;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.EJ.BoardMapper;

@Service("boardService")
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int itemInsert(BoardVO vo) {
		BoardMapper boardMapper = 
				sqlSession.getMapper(BoardMapper.class);
		int res = boardMapper.itemInsert(vo);
		System.out.println("res = " + res);
		
		return res;
	}

}
