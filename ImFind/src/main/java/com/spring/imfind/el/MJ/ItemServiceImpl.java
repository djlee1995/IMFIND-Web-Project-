package com.spring.imfind.el.MJ;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.imfind.el.EJ.PetVO;
import com.spring.mapper.MJ.ItemMapper;

@Service

public class ItemServiceImpl implements ItemService {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<ItemVO> getItemservice(ItemVO vo) {

		ItemMapper mapper = sqlSession.getMapper(ItemMapper.class);
		List<ItemVO> List1 = mapper.getitem(vo);
		List<ItemVO> List2 = mapper.getitem2(vo);
		List<ItemVO> List = new ArrayList<>();
		List.addAll(List1);
		List.addAll(List2);
		return List;
	}

	@Override
	public List<ItemVO> getItemservice(String lost_Title) {
		ItemMapper mapper = sqlSession.getMapper(ItemMapper.class);
		List<ItemVO> List1 = mapper.getItemservice(lost_Title);
		List<ItemVO> List2 = mapper.getItemservice2(lost_Title);
		List<ItemVO> List = new ArrayList<>();
		List.addAll(List1);
		List.addAll(List2);

		return List;

	}

	@Override
	public List<ItemVO> getSido(String lost_Loc) {
		ItemMapper mapper = sqlSession.getMapper(ItemMapper.class);
		List<ItemVO> List1 = mapper.getSido(lost_Loc);
		List<ItemVO> List2 = mapper.getSido2(lost_Loc);
		List<ItemVO> List = new ArrayList<>();
		List.addAll(List1);
		List.addAll(List2);
		return List;

	}

	@Override
	public List<ItemVO> getdata_info(int lost_PostNum) {
		ItemMapper mapper = sqlSession.getMapper(ItemMapper.class);
		List<ItemVO> List = mapper.getdata_info(lost_PostNum);
		return List;
	}

	// YH
	@Override
	public List<IndexLostPostDTO> getItembyDate() {
		ItemMapper mapper = sqlSession.getMapper(ItemMapper.class);
		List<IndexLostPostDTO> List = mapper.getItembyDate();
		return List;
	}

	@Override
	public List<IndexLostPostDTO> getPetItembyDate() {
		ItemMapper mapper = sqlSession.getMapper(ItemMapper.class);
		List<IndexLostPostDTO> List = mapper.getPetItembyDate();
		return List;
	}

	@Override
	public int update_data(ItemVO vo) {
		ItemMapper mapper = sqlSession.getMapper(ItemMapper.class);
		int res = mapper.update_data(vo);

		return res;
	}

	@Override
	public int delete_data(int lost_PostNum) {
		ItemMapper mapper = sqlSession.getMapper(ItemMapper.class);
		int res = mapper.delete_data(lost_PostNum);
		return res;
	}

	// PET
	@Override
	public int petdelete_data(int Pet_PostNum) {
		ItemMapper mapper = sqlSession.getMapper(ItemMapper.class);
		int res = mapper.petdelete_data(Pet_PostNum);
		return res;
	}

	@Override
	public List<PetVO> getPetservice(PetVO vo) {
		ItemMapper mapper = sqlSession.getMapper(ItemMapper.class);
		List<PetVO> List1 = mapper.getPet(vo);
		List<PetVO> List2 = mapper.getPet2(vo);
		List<PetVO> List = new ArrayList<>();
		List.addAll(List1);
		List.addAll(List2);
		return List;
	}

	@Override
	public List<PetVO> getPetservice(String Pet_Title) {
		ItemMapper mapper = sqlSession.getMapper(ItemMapper.class);
		List<PetVO> List1 = mapper.getPetservice(Pet_Title);
		List<PetVO> List2 = mapper.getPetservice2(Pet_Title);
		List<PetVO> List = new ArrayList<>();
		List.addAll(List1);
		List.addAll(List2);
		return List;
	}

	@Override
	public List<PetVO> getPetSido(String Pet_Loc) {
		ItemMapper mapper = sqlSession.getMapper(ItemMapper.class);
		List<PetVO> List1 = mapper.getPetSido(Pet_Loc);
		List<PetVO> List2 = mapper.getPetSido2(Pet_Loc);
		List<PetVO> List = new ArrayList<>();
		List.addAll(List1);
		List.addAll(List2);
		return List;
	}

	@Override
	public List<PetVO> getpetdata_info(int Pet_PostNum) {
		ItemMapper mapper = sqlSession.getMapper(ItemMapper.class);
		List<PetVO> List = mapper.getpetdata_info(Pet_PostNum);
		return List;
	}

	@Override
	public int petupdate_data(PetVO vo) {
		ItemMapper mapper = sqlSession.getMapper(ItemMapper.class);
		int res = mapper.petupdate_data(vo);
		return res;
	}

	// 좋아요
	@Override
	public int like_plus(int lost_PostNum, String id) {
		ItemMapper mapper = sqlSession.getMapper(ItemMapper.class);
		return mapper.like_plus(lost_PostNum, id);
	}

	@Override
	public int like_cancel(int lost_PostNum, String id) {
		ItemMapper mapper = sqlSession.getMapper(ItemMapper.class);
		return mapper.like_cancel(lost_PostNum, id);
	}

	@Override
	public List<ItemVO> likeChk() {
		ItemMapper mapper = sqlSession.getMapper(ItemMapper.class);
		return mapper.likeChk();
	}

	@Override
	public int likeCount(int lost_PostNum) {
		ItemMapper mapper = sqlSession.getMapper(ItemMapper.class);
		return mapper.likeCount(lost_PostNum);
	}

	// 좋아요(pet)
	@Override
	public int pet_like_plus(int Pet_PostNum, String id) {
		ItemMapper mapper = sqlSession.getMapper(ItemMapper.class);
		return mapper.pet_like_plus(Pet_PostNum, id);
	}

	@Override
	public int pet_like_cancel(int Pet_PostNum, String id) {
		ItemMapper mapper = sqlSession.getMapper(ItemMapper.class);
		return mapper.pet_like_cancel(Pet_PostNum, id);
	}

	@Override
	public int pet_likeCount(int Pet_PostNum) {
		ItemMapper mapper = sqlSession.getMapper(ItemMapper.class);
		return mapper.pet_likeCount(Pet_PostNum);
	}

	// 사례금 랭크
	@Override
	public List<ItemVO> lost_pay_rank(ItemVO vo) {
		ItemMapper mapper = sqlSession.getMapper(ItemMapper.class);
		return mapper.lost_pay_rank(vo);
	}

	// 사례금 랭크(pet)
	@Override
	public List<PetVO> pet_pay_rank(PetVO vo) {
		ItemMapper mapper = sqlSession.getMapper(ItemMapper.class);

		return mapper.pet_pay_rank(vo);
	}

	// 좋아요 랭크
	@Override
	public List<ItemVO> lost_like_rank() {
		ItemMapper mapper = sqlSession.getMapper(ItemMapper.class);
		int lost_PostNum = mapper.lost_like_rank();
		return mapper.getdata_info(lost_PostNum);
	}

	// 좋아요 랭크(pet)
	@Override
	public List<PetVO> pet_like_rank() {
		ItemMapper mapper = sqlSession.getMapper(ItemMapper.class);
		int Pet_PostNum = mapper.pet_like_rank();
		return mapper.getpetdata_info(Pet_PostNum);
	}

}