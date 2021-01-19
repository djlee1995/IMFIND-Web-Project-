<<<<<<< HEAD
package com.spring.imfind.el.MJ;

import java.util.List;

public interface ItemService {
			public List<ItemVO> getItemservice(ItemVO vo);
			public List<ItemVO> getItemservice(String lost_Title);
			public List<SelectVO> getSido(String sido,String gu, String dong);
			public List<ItemVO> getdata_info(int lost_PostNum);
			
}
=======
package com.spring.imfind.el.MJ;

import java.util.List;

public interface ItemService {
	public List<ItemVO> getItemservice(ItemVO vo);
	public List<ItemVO> getItemservice(String lost_Title);
	public List<SelectVO> getSido(String sido,String gu, String dong);
	public List<ItemVO> getdata_info(int lost_PostNum);
	
	// YH
	List<IndexLostPostDTO> getItembyDate();
}
>>>>>>> dd989063f89186c6b2e1561ca33d1f1d7ef91ae8
