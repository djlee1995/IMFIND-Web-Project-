
package com.spring.mapper.MJ;

import java.util.List;

import com.spring.imfind.el.MJ.IndexLostPostDTO;
import com.spring.imfind.el.MJ.ItemVO;


public interface ItemMapper {
   List<ItemVO> getitem(ItemVO vo);
    List<ItemVO> getItemservice(String lost_Title);
   List<ItemVO> getSido(String lost_Loc);
   List<ItemVO> getdata_info(int lost_PostNum);
   int update_data(ItemVO vo);
   int delete_data(int lost_PostNum);
   
   // YH
   List<IndexLostPostDTO> getItembyDate();
   
   
}
