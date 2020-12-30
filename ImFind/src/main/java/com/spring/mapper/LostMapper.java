package com.spring.mapper;

import java.util.HashMap;
import java.util.List;

import com.spring.imfind.imf.*;;;


public interface LostMapper {
	//List<LostVO> getMembers();
	List<PoliceVO> police();
	List<PoliceVO> p_lostlist(String placeid);
	List<PoliceVO> p_info(String code);
	List<EtcVO> etc();
	List<EtcVO> s_lostlist(String tel);
	List<EtcVO> s_info(String code);

}
