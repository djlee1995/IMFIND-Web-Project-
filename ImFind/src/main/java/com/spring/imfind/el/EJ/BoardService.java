package com.spring.imfind.el.EJ;

import java.util.List;

public interface BoardService {
   public int itemInsert(BoardVO boardvo); // 물품 분실 등록
   public List<MemberVO> getPayMember(String id);
   public int insertPay(PayVO payVO);
   public int petInsert(PetVO petvo); // 애완동물 분실 등록
   
   public int commentCount() throws Exception; //댓글갯수
   public List<LostComVO> commentList(int Lost_PostNum) throws Exception; //댓글리스트
   public int commentInsert(LostComVO comment) throws Exception; //댓글추가
   public int commentUpdate(LostComVO comment) throws Exception; //댓글수정
   public int commentDelete(int cno) throws Exception; //댓글삭제
   
   public int commentReply(LostComVO comment);
   public int updatePay(PayVO payVO);// 사례금 환불신청
   //동준 대댓글
   List<replyVO> replyList() throws Exception;
   public int replyInsert(replyVO vo) throws Exception; 
   int replyDelete(int re_num)throws Exception;
   
   //유희 인덱스
   public List<BoardVO> gethighsetLostPay() throws Exception;
   public List<PetVO> gethighsetPetPay() throws Exception;
   public int addPayBoardNum(BoardVO vo) throws Exception;
}