
package com.spring.imfind.imf;

import java.util.HashMap;
import java.util.List;

public interface LostService {

	public List<PoliceVO> police();

	public List<PoliceVO> p_lostlist(String placeid);

	public List<PoliceVO> p_info(String code);

	public List<EtcVO> etc();

	public List<EtcVO> s_lostlist(String tel);

	public List<EtcVO> s_info(String code);

	public List<PoliceVO> p_select(String city, String gu, String kind);

	public List<EtcVO> s_select(String city, String gu, String kind);

	public List<PoliceVO> p_select_place(String city, String gu);

	public List<EtcVO> s_select_place(String city, String gu);

	public int chartcount(String kind);

	// 유희
	public List<PoliceVO> getSimpleList(String x, String y);

}
