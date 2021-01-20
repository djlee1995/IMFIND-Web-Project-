package com.spring.mapper.YS;

import java.util.List;

import com.spring.imfind.el.YS.ElVO;

public interface ElMapper {

	List<ElVO> getElsedata(String id);
	
	List<ElVO> getPatElsedata(String id);

	List<ElVO> getElsePaydata(String id);

	List<ElVO> getElseWhoReplied(String lost_Postnum);
	
	

}
