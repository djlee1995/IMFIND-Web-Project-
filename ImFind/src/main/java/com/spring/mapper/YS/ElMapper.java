<<<<<<< HEAD
package com.spring.mapper.YS;

import java.util.List;

import com.spring.imfind.el.YS.ElVO;

public interface ElMapper {

	List<ElVO> getElsedata(String id);

	List<ElVO> getElsePaydata(String id);

	List<ElVO> getElseWhoReplied(String lost_Postnum);
	
	

}
=======
package com.spring.mapper.YS;

import java.util.List;

import com.spring.imfind.el.YS.ElVO;

public interface ElMapper {

	List<ElVO> getElsedata(String id);
	
	List<ElVO> getPatElsedata(String id);

	List<ElVO> getElsePaydata(String id);

	List<ElVO> getElseWhoReplied(String lost_Postnum);
	
	

}
>>>>>>> 1bc2d5d6e29ce0f76b38df57bebec67ff8eaa466
