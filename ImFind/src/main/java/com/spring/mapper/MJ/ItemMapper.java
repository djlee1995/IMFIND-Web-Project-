package com.spring.mapper.MJ;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.imfind.el.EJ.PetVO;
import com.spring.imfind.el.MJ.IndexLostPostDTO;
import com.spring.imfind.el.MJ.ItemVO;

public interface ItemMapper {
	List<ItemVO> getitem(ItemVO vo);

	List<ItemVO> getItemservice(String lost_Title);

	List<ItemVO> getSido(String lost_Loc);

	List<ItemVO> getitem2(ItemVO vo);

	List<ItemVO> getItemservice2(String lost_Title);

	List<ItemVO> getSido2(String lost_Loc);

	List<ItemVO> getdata_info(int lost_PostNum);

	int update_data(ItemVO vo);

	int delete_data(int lost_PostNum);

	int like_plus(@Param("lost_PostNum") int lost_PostNum, @Param("id") String id);

	int like_cancel(@Param("lost_PostNum") int lost_PostNum, @Param("id") String id);

	List<ItemVO> likeChk();

	int likeCount(int lost_PostNum);

	// YH
	List<IndexLostPostDTO> getItembyDate();

	List<IndexLostPostDTO> getPetItembyDate();

	// PET
	int petdelete_data(int Pet_PostNum);

	List<PetVO> getPet(PetVO vo);

	List<PetVO> getPetservice(String Pet_Title);

	List<PetVO> getPetSido(String Pet_Loc);

	List<PetVO> getPet2(PetVO vo);

	List<PetVO> getPetservice2(String Pet_Title);

	List<PetVO> getPetSido2(String Pet_Loc);

	List<PetVO> getpetdata_info(int Pet_PostNum);

	int petupdate_data(PetVO vo);

	int pet_like_plus(@Param("Pet_PostNum") int Pet_PostNum, @Param("id") String id);

	int pet_like_cancel(@Param("Pet_PostNum") int Pet_PostNum, @Param("id") String id);

	int pet_likeCount(int lost_PostNum);

	// 사례금 랭크
	List<ItemVO> lost_pay_rank(ItemVO vo);

	// 사례금 랭크(pet)
	List<PetVO> pet_pay_rank(PetVO vo);

	// 좋아요 랭크
	int lost_like_rank();

	// 좋아요 랭크(pet)
	int pet_like_rank();

}