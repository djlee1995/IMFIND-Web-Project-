package com.spring.imfind.el.YS;

import java.util.List;

public interface ElService {
List<ElVO> getElsedata(String id);
	
	List<ElVO> getElsePaydata(String id);
	
	//List<ElVO> getElseWhoReplied();

	List<ElVO> getElseWhoReplied(String lost_Postnum);
}
