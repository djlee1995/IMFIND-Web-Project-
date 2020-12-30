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
}
