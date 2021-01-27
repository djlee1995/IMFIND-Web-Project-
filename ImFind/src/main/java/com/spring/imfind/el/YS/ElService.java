<<<<<<< HEAD

package com.spring.imfind.el.YS;

import java.util.List;

public interface ElService {
	List<ElVO> getElsedata(String id);

	List<ElVO> getElsePaydata(String id);

	List<ElVO> getElseWhoReplied(String lost_Postnum);

	List<ElVO> getPatElsedata(String id);
}
=======
package com.spring.imfind.el.YS;
import java.util.List;
import com.spring.imfind.el.EJ.PayVO;
public interface ElService {
	List<ElVO> getElsedata(String id);
	List<ElVO> getElsePaydata(String id);
	//List<ElVO> getElseWhoReplied(String lost_Postnum);
	List<ElVO> getElseWhoReplied(String params);
	List<ElVO> getPetElsedata(String id);
	public void updatePay_Grade(ElVO elvo);
	public void insertGrade(ElVO elvo);
}
>>>>>>> main_dev
