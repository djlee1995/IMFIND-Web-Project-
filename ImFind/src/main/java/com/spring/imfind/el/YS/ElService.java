<<<<<<< HEAD

package com.spring.imfind.el.YS;

import java.util.List;

public interface ElService {
List<ElVO> getElsedata(String id);
	
	List<ElVO> getElsePaydata(String id);

	List<ElVO> getElseWhoReplied(String lost_Postnum);
}
=======
package com.spring.imfind.el.YS;

import java.util.List;

public interface ElService {
	List<ElVO> getElsedata(String id);

	List<ElVO> getPatElsedata(String id);
	
	List<ElVO> getElsePaydata(String id);
	
	//List<ElVO> getElseWhoReplied();

	List<ElVO> getElseWhoReplied(String lost_Postnum);
}
>>>>>>> 1bc2d5d6e29ce0f76b38df57bebec67ff8eaa466
