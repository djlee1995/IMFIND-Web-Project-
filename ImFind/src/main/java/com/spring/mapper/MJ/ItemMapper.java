<<<<<<< HEAD
package com.spring.mapper.MJ;

import java.util.List;

import com.spring.imfind.el.MJ.ItemVO;
import com.spring.imfind.el.MJ.SelectVO;

public interface ItemMapper {
	List<ItemVO> getitem(ItemVO vo);
    List<ItemVO> getItemservice(String lost_Title);
	List<SelectVO> getSido(String sido,String gu, String dong);
	List<ItemVO> getdata_info(int lost_PostNum);
}

=======
package com.spring.mapper.MJ;

import java.util.List;

import com.spring.imfind.el.MJ.IndexLostPostDTO;
import com.spring.imfind.el.MJ.ItemVO;
import com.spring.imfind.el.MJ.SelectVO;

public interface ItemMapper {
	List<ItemVO> getitem(ItemVO vo);
    List<ItemVO> getItemservice(String lost_Title);
	List<SelectVO> getSido(String sido,String gu, String dong);
	List<ItemVO> getdata_info(int lost_PostNum);
	
	// YH
	List<IndexLostPostDTO> getItembyDate();
	
}

>>>>>>> dd989063f89186c6b2e1561ca33d1f1d7ef91ae8
