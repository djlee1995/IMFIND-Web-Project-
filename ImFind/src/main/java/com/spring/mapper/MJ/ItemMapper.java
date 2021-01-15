package com.spring.mapper.MJ;

import java.util.List;

import com.spring.imfind.el.MJ.ItemVO;
import com.spring.imfind.el.MJ.SelectVO;

public interface ItemMapper {
	List<ItemVO> getitem(ItemVO vo);
	public List<ItemVO> getItemservice(String lost_Title);
	List<SelectVO> getSido(String sido,String gu, String dong);
}
