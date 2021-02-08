package com.spring.imfind.el.MJ;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.imfind.el.EJ.PetVO;

public interface ItemService {
	public List<ItemVO> getItemservice(ItemVO vo);

	public List<ItemVO> getItemservice(String lost_Title);

	public List<ItemVO> getSido(String lost_Loc);

	public List<ItemVO> getdata_info(int lost_PostNum);

	public int update_data(ItemVO vo);

	public int delete_data(int lost_PostNum);

	public int like_plus(int lost_PostNum, String id);

	public int like_cancel(int lost_PostNum, String id);

	public List<ItemVO> likeChk();

	public int likeCount(int lost_PostNum);

	// YH
	public List<IndexLostPostDTO> getItembyDate();

	public List<IndexLostPostDTO> getPetItembyDate();

	// PET
	public int petdelete_data(int Pet_PostNum);

	public List<PetVO> getPetservice(PetVO vo);

	public List<PetVO> getPetservice(String Pet_Title);

	public List<PetVO> getPetSido(String Pet_Loc);

	public List<PetVO> getpetdata_info(int Pet_PostNum);

	public int petupdate_data(PetVO vo);

	public int pet_like_plus(int Pet_PostNum, String id);

	public int pet_like_cancel(int Pet_PostNum, String id);

	public int pet_likeCount(int lost_PostNum);

	// 사례금 랭크
	public List<ItemVO> lost_pay_rank(ItemVO vo);

	// 사례금 랭크(pet)
	public List<PetVO> pet_pay_rank(PetVO vo);

	// 좋아요 랭크
	public List<ItemVO> lost_like_rank();

	// 좋아요 랭크(pet)
	public List<PetVO> pet_like_rank();

}