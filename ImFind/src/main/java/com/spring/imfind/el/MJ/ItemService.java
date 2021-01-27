package com.spring.imfind.el.MJ;

import java.util.List;

<<<<<<< HEAD
public interface ItemService {
	public List<ItemVO> getItemservice(ItemVO vo);
	public List<ItemVO> getItemservice(String lost_Title);
	public List<SelectVO> getSido(String sido,String gu, String dong);
	public List<ItemVO> getdata_info(int lost_PostNum);
	public int update_data(ItemVO vo);
	public int delete_data(int lost_PostNum);
	
	// YH
	public List<IndexLostPostDTO> getItembyDate();
}
=======
import com.spring.imfind.el.EJ.PetVO;
>>>>>>> main_dev

public interface ItemService {
   public List<ItemVO> getItemservice(ItemVO vo);
   public List<ItemVO> getItemservice(String lost_Title);
   public List<ItemVO> getSido(String lost_Loc);
   public List<ItemVO> getdata_info(int lost_PostNum);
   public int update_data(ItemVO vo);
   public int delete_data(int lost_PostNum);
   
   // YH
   public List<IndexLostPostDTO> getItembyDate();
   
 //PET
   public int petdelete_data(int Pet_PostNum);
   public List<PetVO> getPetservice(PetVO vo);
   public List<PetVO> getPetservice(String Pet_Title);
   public List<PetVO> getPetSido(String Pet_Loc);
   public List<PetVO> getpetdata_info(int Pet_PostNum);
   public int petupdate_data(PetVO vo);
}