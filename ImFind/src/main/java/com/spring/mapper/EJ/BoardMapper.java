package com.spring.mapper.EJ;

import java.util.List;

import com.spring.imfind.el.EJ.BoardVO;
import com.spring.imfind.el.EJ.LostComVO;
import com.spring.imfind.el.EJ.MemberVO;
import com.spring.imfind.el.EJ.PayVO;
import com.spring.imfind.el.EJ.PetVO;

public interface BoardMapper {
	public int itemInsert(BoardVO vo);  // 물품 분실 등록
	public List<MemberVO> getPayMember(String id);
	public int insertPay(PayVO payVO);
	public int petInsert(PetVO petvo); // 애완동물 분실 등록
	
	public int commentCount() throws Exception; //댓글갯수
	public List<LostComVO> commentList(int Lost_PostNum) throws Exception; //댓글리스트
	public int commentInsert(LostComVO comment) throws Exception; //댓글추가
	public int commentUpdate(LostComVO comment) throws Exception; //댓글수정
	public int commentDelete(int Com_Num) throws Exception; //댓글삭제
	
	public int commentReplyupdate(LostComVO comment); //답글에 대한 re_seq update작업
	public int commentReply(LostComVO comment); //답글 insert작업 수행
}
