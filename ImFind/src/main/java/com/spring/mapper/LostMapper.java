
package com.spring.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.imfind.imf.*;;;

public interface LostMapper {
	List<PoliceVO> police();

	List<PoliceVO> p_lostlist(String placeid);

	List<PoliceVO> p_info(String code);

	List<EtcVO> etc();

	List<EtcVO> s_lostlist(String tel);

	List<EtcVO> s_info(String code);

	List<PoliceVO> p_select(@Param("city") String city, @Param("gu") String gu, @Param("kind") String kind);

	List<EtcVO> s_select(@Param("city") String city, @Param("gu") String gu, @Param("kind") String kind);

	List<PoliceVO> p_select_place(@Param("city") String city, @Param("gu") String gu);

	List<EtcVO> s_select_place(@Param("city") String city, @Param("gu") String gu);

	int chartcount(String kind);

	int chartcount2(String kind);

	// 유희
	List<PoliceVO> getSimpleList(@Param("x") String x, @Param("y") String y);

}
