package com.spring.mapper.MJ;

import java.util.List;

import com.spring.imfind.el.MJ.ItemVO;

public interface ItemMapper {
	List<ItemVO> getitem(ItemVO vo);
	public List<ItemVO> getItemservice(String lost_Title);

}
