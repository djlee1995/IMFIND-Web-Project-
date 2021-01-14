package com.spring.imfind.el.MJ;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.MJ.ItemMapper;

@Service
public class ItemServiceImpl implements ItemService{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<ItemVO> getItemservice(ItemVO vo) {
		
		ItemMapper mapper = sqlSession.getMapper(ItemMapper.class);
		List<ItemVO> List = mapper.getitem(vo);
		
		
		return List;
	}
	@Override
	public List<ItemVO> getItemservice(String lost_Title){
		ItemMapper mapper = sqlSession.getMapper(ItemMapper.class);
		List<ItemVO> List = mapper.getItemservice(lost_Title);
		
		
		return List;
		
	}
}
 