<<<<<<< HEAD
package com.spring.imfind.el.YS;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.YS.ElMapper;

@Service("elService")
public class ElServiceImpl implements ElService{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<ElVO> getElsedata(String id) {
		List<ElVO>elseList=null;
		ElMapper elMapper=sqlSession.getMapper(ElMapper.class);
		elseList=elMapper.getElsedata(id);
				
		return elseList;
	}

	@Override
	public List<ElVO> getElsePaydata(String id) {
		List<ElVO>elseList2=null;
		ElMapper elMapper=sqlSession.getMapper(ElMapper.class);
		elseList2=elMapper.getElsePaydata(id);	
				
		return elseList2;
	}


	@Override
	public List<ElVO> getElseWhoReplied(String lost_Postnum) {
		List<ElVO>elseList3=null;
		ElMapper elMapper=sqlSession.getMapper(ElMapper.class);
		elseList3=elMapper.getElseWhoReplied(lost_Postnum);
		
		return elseList3;
	}

}
=======
package com.spring.imfind.el.YS;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.YS.ElMapper;

@Service("elService")
public class ElServiceImpl implements ElService{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<ElVO> getElsedata(String id) {
		
		List<ElVO>elseList=null;
		ElMapper elMapper=sqlSession.getMapper(ElMapper.class);
		elseList=elMapper.getElsedata(id);
		
		System.out.println(elseList.toString());
		
		return elseList;
	}
	
	@Override
	public List<ElVO> getPatElsedata(String id) {
		
				List<ElVO>patelseList=null;
				ElMapper elMapper=sqlSession.getMapper(ElMapper.class);
				patelseList=elMapper.getElsedata(id);
				
				System.out.println(patelseList.toString());
				
				return patelseList;
	}

	
	@Override
	public List<ElVO> getElsePaydata(String id) {
		
		List<ElVO>elseList2=null;
		ElMapper elMapper=sqlSession.getMapper(ElMapper.class);
		
		elseList2=elMapper.getElsePaydata(id);	
		
		System.out.println(elseList2.toString());
		
		return elseList2;
	}


	@Override
	public List<ElVO> getElseWhoReplied(String lost_Postnum) {
		
		List<ElVO>elseList3=null;
		ElMapper elMapper=sqlSession.getMapper(ElMapper.class);
		elseList3=elMapper.getElseWhoReplied(lost_Postnum);
		
		return elseList3;
	}

	
}
>>>>>>> 1bc2d5d6e29ce0f76b38df57bebec67ff8eaa466
