package com.spring.mapper.EJ;

import java.util.List;

import com.spring.imfind.el.EJ.BoardVO;
import com.spring.imfind.el.EJ.MemberVO;
import com.spring.imfind.el.EJ.PayVO;
import com.spring.imfind.el.EJ.PetVO;

public interface BoardMapper {
	public int itemInsert(BoardVO vo);  // 물품 분실 등록
	public List<MemberVO> getPayMember(String id);
	public int insertPay(PayVO payVO);
	public int petInsert(PetVO petvo); // 애완동물 분실 등록
}
