
package com.spring.imfind.el.MJ;

import java.util.List;

public interface ItemService {
	public List<ItemVO> getItemservice(ItemVO vo);
	public List<ItemVO> getItemservice(String lost_Title);
	public List<SelectVO> getSido(String sido,String gu, String dong);
	public List<ItemVO> getdata_info(int lost_PostNum);
	public int update_data(ItemVO vo);
	
	// YH
	public List<IndexLostPostDTO> getItembyDate();
}

