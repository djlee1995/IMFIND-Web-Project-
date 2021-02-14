
package com.spring.imfind.el.YS;

import java.util.ArrayList;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.imfind.el.EJ.PetVO;
import com.spring.mapper.YS.ElMapper;

@Service("elService")
public class ElServiceImpl implements ElService {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<ElVO> getElsedata(String id) {

		ElMapper elMapper = sqlSession.getMapper(ElMapper.class);
		List<ElVO> elseList1 = elMapper.getElsedata(id);
		List<ElVO> elseList2 = elMapper.getElsedata2(id);
		List<ElVO> List = new ArrayList<>();
		List.addAll(elseList1);
		List.addAll(elseList2);
		return List;
	}

	@Override
	public List<ElVO> getPetElsedata(String id) {
		ElMapper elMapper = sqlSession.getMapper(ElMapper.class);
		List<ElVO> elseList1 = elMapper.getPetElsedata(id);
		List<ElVO> elseList2 = elMapper.getPetElsedata2(id);
		List<ElVO> List = new ArrayList<>();
		List.addAll(elseList1);
		List.addAll(elseList2);
		return List;
	}

	@Override
	public List<ElVO> getElsePaydata(String id) {
		List<ElVO> elseList2 = null;
		ElMapper elMapper = sqlSession.getMapper(ElMapper.class);
		elseList2 = elMapper.getElsePaydata(id);
		return elseList2;
	}

	@Override
	public List<ElVO> getElseWhoReplied(String params) {
		List<ElVO> elseList3 = null;
		int param = Integer.parseInt(params);

		ElMapper elMapper = sqlSession.getMapper(ElMapper.class);

		elseList3 = elMapper.getElseWhoReplied(param);

		return elseList3;
	}

	@Override
	public int insertGrade(ElVO elvo) {
		ElMapper elMapper = sqlSession.getMapper(ElMapper.class);
		int res = elMapper.insertGrade(elvo);

		return res;
	}

	@Override
	public int updatePay_Grade(ElVO elvo) {
		ElMapper elMapper = sqlSession.getMapper(ElMapper.class);
		int res = elMapper.updatePay_Grade(elvo);
		return res;
	}

	@Override
	public int updatePay_GradePet(ElVO elvo) {
		ElMapper elMapper = sqlSession.getMapper(ElMapper.class);
		int res = elMapper.updatePay_GradePet(elvo);
		return res;
	}

	@Override
	public List<ElVO> getElseWhoRepliedPet(String params) {

		List<ElVO> elseList3 = null;
		int param = Integer.parseInt(params);

		ElMapper elMapper = sqlSession.getMapper(ElMapper.class);
		elseList3 = elMapper.getElseWhoRepliedPet(param);

		return elseList3;
	}

	// YS 1.28 연수
	@Override
	public List<ElVO> getStarGrade(String F_Id) {
		// TODO Auto-generated method stub
		ElMapper elMapper = sqlSession.getMapper(ElMapper.class);
		List<ElVO> list = elMapper.getStarGrade(F_Id);
		return list;
	}
	
	   @Override
	   public List<ElVO> getlike(String id) {
	      ElMapper elMapper = sqlSession.getMapper(ElMapper.class);
	      List<ElVO> List1 = elMapper.getlike_lost(id);
	      List<ElVO> List2 = elMapper.getlike_pet(id);
	      List<ElVO> List = new ArrayList<>();
	      List.addAll(List1);
	      List.addAll(List2);
	      return List;
	   }


}