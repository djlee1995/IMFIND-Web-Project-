package com.spring.mapper.MJ;

import java.util.List;

import com.spring.imfind.el.EJ.PetVO;
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
   
   // PET
   int petdelete_data(int Pet_PostNum);
   List<PetVO> getPet(PetVO vo);
   List<PetVO> getPetservice(String Pet_Title);
   List<PetVO> getPetSido(String Pet_Loc);
   List<PetVO> getpetdata_info(int Pet_PostNum);
   int petupdate_data(PetVO vo);
}