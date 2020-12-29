package com.spring.mapper;

import java.util.HashMap;
import java.util.List;

import com.spring.imfind.imf.*;;;


public interface LostMapper {
	//List<LostVO> getMembers();
	List<LostVO> place();
	List<LostVO> lostlist(String placeid);
	

}
