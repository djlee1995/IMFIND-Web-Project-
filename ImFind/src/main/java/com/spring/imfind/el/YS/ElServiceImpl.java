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
	public List<ElVO> getPetElsedata(String id) {
				List<ElVO>petelseList=null;
				ElMapper elMapper=sqlSession.getMapper(ElMapper.class);
				petelseList=elMapper.getPetElsedata(id);
				System.out.println(petelseList.toString());
				return petelseList;
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
	public List<ElVO> getElseWhoReplied(String params) {
		List<ElVO>elseList3=null;
		System.out.println("params:"+ params);
		ElMapper elMapper=sqlSession.getMapper(ElMapper.class);
		int param = Integer.parseInt(params);//U
		elseList3=elMapper.getElseWhoReplied(param);
		System.out.println("elseList3:whyarethey" + elseList3);//2021202008
		return elseList3;
	}
	@Override
//	public int insertGrade(ElVO elvo) {
		public void insertGrade(ElVO elvo) {	
		// TODO Auto-generated method stub
		ElMapper elMapper=sqlSession.getMapper(ElMapper.class);
		//int res=elMapper.insertGrade(elvo);
		elMapper.insertGrade(elvo);
		return;
	}
	@Override
	//public int updatePay_Grade(ElVO elvo) {
		public void updatePay_Grade(ElVO elvo) {
		// TODO Auto-generated method stub
		ElMapper elMapper=sqlSession.getMapper(ElMapper.class);
		//int res=elMapper.updatePay_Grade(elvo);
		elMapper.updatePay_Grade(elvo);
		return;
	}
	/*
	 * @Override public List<ElVO> getElseWhoReplied(String params) { // TODO
	 * Auto-generated method stub List<ElVO>elseList3=null;
	 * System.out.println("params:"+ params);
	 * 
	 * ElMapper elMapper=sqlSession.getMapper(ElMapper.class); int param =
	 * Integer.parseInt(params); elseList3=elMapper.getElseWhoReplied(param);
	 * System.out.println("elseList3:whyarethey" + elseList3);//2021202008 return
	 * elseList3; }
	 */
}