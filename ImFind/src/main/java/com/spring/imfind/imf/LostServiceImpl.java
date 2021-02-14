
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

	@Override
	public List<PoliceVO> police() {
		List<PoliceVO> place = null;
		LostMapper lostMapper = sqlSession.getMapper(LostMapper.class);
		place = lostMapper.police();
		return place;
	}

	@Override
	public List<PoliceVO> p_lostlist(String placeid) {
		List<PoliceVO> p_lostlist = null;
		LostMapper lostMapper = sqlSession.getMapper(LostMapper.class);
		p_lostlist = lostMapper.p_lostlist(placeid);
		return p_lostlist;
	}

	@Override
	public List<PoliceVO> p_info(String code) {
		List<PoliceVO> p_info = null;
		LostMapper lostMapper = sqlSession.getMapper(LostMapper.class);
		p_info = lostMapper.p_info(code);
		return p_info;
	}

	@Override
	public List<EtcVO> etc() {
		List<EtcVO> etc = null;
		LostMapper lostMapper = sqlSession.getMapper(LostMapper.class);
		etc = lostMapper.etc();
		return etc;
	}

	@Override
	public List<EtcVO> s_lostlist(String tel) {
		List<EtcVO> s_lostlist = null;
		LostMapper lostMapper = sqlSession.getMapper(LostMapper.class);
		s_lostlist = lostMapper.s_lostlist(tel);
		return s_lostlist;
	}

	@Override
	public List<EtcVO> s_info(String code) {
		List<EtcVO> s_info = null;
		LostMapper lostMapper = sqlSession.getMapper(LostMapper.class);
		s_info = lostMapper.s_info(code);
		return s_info;
	}

	@Override
	public List<PoliceVO> p_select(String city, String gu, String kind) {
		List<PoliceVO> p_select = null;
		LostMapper lostMapper = sqlSession.getMapper(LostMapper.class);
		p_select = lostMapper.p_select(city, gu, kind);
		return p_select;
	}

	@Override
	public List<EtcVO> s_select(String city, String gu, String kind) {
		List<EtcVO> s_select = null;
		LostMapper lostMapper = sqlSession.getMapper(LostMapper.class);
		s_select = lostMapper.s_select(city, gu, kind);
		return s_select;
	}

	@Override
	public List<PoliceVO> p_select_place(String city, String gu) {
		List<PoliceVO> p_select_place = null;
		LostMapper lostMapper = sqlSession.getMapper(LostMapper.class);
		p_select_place = lostMapper.p_select_place(city, gu);
		return p_select_place;
	}

	@Override
	public List<EtcVO> s_select_place(String city, String gu) {
		List<EtcVO> s_select_place = null;
		LostMapper lostMapper = sqlSession.getMapper(LostMapper.class);
		s_select_place = lostMapper.s_select_place(city, gu);
		return s_select_place;
	}

	public int chartcount(String kind) {
		LostMapper lostMapper = sqlSession.getMapper(LostMapper.class);
		int res = lostMapper.chartcount(kind);
		int res2 = lostMapper.chartcount2(kind);

		return res + res2;
	}

	// 유희
	@Override
	public List<PoliceVO> getSimpleList(String x, String y) {

		List<PoliceVO> s_select_place = null;
		LostMapper lostMapper = sqlSession.getMapper(LostMapper.class);
		s_select_place = lostMapper.getSimpleList(x, y);
		return s_select_place;
	}

}