package com.spring.imfind.el.EJ;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.EJ.AdminMapper;
import com.spring.mapper.EJ.BoardMapper;

@Service
public class AdiminServiceImpl implements AdminService {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<MemberVO> getMemberList() {
		AdminMapper adminMapper = sqlSession.getMapper(AdminMapper.class);
		List<MemberVO> memberlist = adminMapper.getMemberList();

		return memberlist;
	}

	@Override
	public List<PayVO> getPayList() {
		AdminMapper adminMapper = sqlSession.getMapper(AdminMapper.class);
		List<PayVO> paylist = adminMapper.getPayList();

		return paylist;
	}

	@Override
	public List<PayVO> getPaidList() {
		AdminMapper adminMapper = sqlSession.getMapper(AdminMapper.class);
		List<PayVO> paylist = adminMapper.getPaidList();

		return paylist;
	}

	@Override
	public List<PayVO> getRefundList() {
		AdminMapper adminMapper = sqlSession.getMapper(AdminMapper.class);
		List<PayVO> paylist = adminMapper.getRefundList();

		return paylist;
	}

	@Override
	public int updatePaystate(PayVO payVO) {
		AdminMapper adminMapper = sqlSession.getMapper(AdminMapper.class);
		int res = adminMapper.updatePaystate(payVO);

		return res;
	}

	@Override
	public List<PayVO> getCancleList() {
		AdminMapper adminMapper = sqlSession.getMapper(AdminMapper.class);
		List<PayVO> paylist = adminMapper.getCancleList();

		return paylist;
	}
}
