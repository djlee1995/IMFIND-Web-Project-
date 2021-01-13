package com.spring.imfind.el.EJ;

import java.util.List;

public interface BoardService {
	public int itemInsert(BoardVO boardvo); // 물품 분실 등록
	public List<MemberVO> getPayMember(String id);
	public int insertPay(PayVO payVO);
	public int petInsert(PetVO petvo); // 애완동물 분실 등록
}
