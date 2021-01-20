
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
	
	@Override
	public List<SelectVO> getSido(String sido,String gu, String dong){
		ItemMapper mapper = sqlSession.getMapper(ItemMapper.class);
		List<SelectVO> List = mapper.getSido(sido,gu,dong);
		
		
		return List;
		
	}
	@Override
	public List<ItemVO> getdata_info(int lost_PostNum) {
		ItemMapper mapper = sqlSession.getMapper(ItemMapper.class);
		List<ItemVO> List = mapper.getdata_info(lost_PostNum);
		return List;
	}
	
	// YH
	@Override
	public List<IndexLostPostDTO> getItembyDate() {
		ItemMapper mapper = sqlSession.getMapper(ItemMapper.class);
		List<IndexLostPostDTO> List = mapper.getItembyDate();
		return List;
	}
	@Override
	public int update_data(ItemVO vo) {
		ItemMapper mapper = sqlSession.getMapper(ItemMapper.class);
		int res  = mapper.update_data(vo);
	
		return res;
	}
	
	
}
 