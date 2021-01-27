package com.spring.imfind.el.EJ;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.EJ.BoardMapper;

@Service("boardService")
public class BoardServiceImpl implements BoardService {
   
   @Autowired
   private SqlSession sqlSession;
   
   @Override
   public int itemInsert(BoardVO boardvo) {
      BoardMapper boardMapper = 
            sqlSession.getMapper(BoardMapper.class);
      int res = boardMapper.itemInsert(boardvo);
      
      System.out.println(boardvo.toString());
      
      return res;
   }
   
   @Override
   public List<MemberVO> getPayMember(String id) {
      BoardMapper boardMapper =
            sqlSession.getMapper(BoardMapper.class);
      List<MemberVO> list = boardMapper.getPayMember(id);
      
      
      return list;
   }
   
   @Override
   public int insertPay(PayVO payVO) {
      
      BoardMapper boardMapper =
            sqlSession.getMapper(BoardMapper.class);
      int res = boardMapper.insertPay(payVO);
      
      
      return res;
   }
   
   
   @Override
   public int petInsert(PetVO petvo) {
      BoardMapper boardMapper = 
            sqlSession.getMapper(BoardMapper.class);
      int res = boardMapper.petInsert(petvo);
      
      
      return res;
   }
   
   
   @Override
   public int commentCount() throws Exception {
      BoardMapper boardMapper =
            sqlSession.getMapper(BoardMapper.class);

      
      return boardMapper.commentCount();
   }

   @Override
   public List<LostComVO> commentList(int Lost_PostNum) throws Exception {
      BoardMapper boardMapper =
            sqlSession.getMapper(BoardMapper.class);

      
      return boardMapper.commentList(Lost_PostNum);
   }

   @Override
   public int commentInsert(LostComVO comment) throws Exception {
      BoardMapper boardMapper =
            sqlSession.getMapper(BoardMapper.class);

      return boardMapper.commentInsert(comment);
   }

   @Override
   public int commentUpdate(LostComVO comment) throws Exception {
      BoardMapper boardMapper =
            sqlSession.getMapper(BoardMapper.class);

      
      return boardMapper.commentUpdate(comment);
   }

   @Override
   public int commentDelete(int Com_Num) throws Exception {
      BoardMapper boardMapper =
            sqlSession.getMapper(BoardMapper.class);

      return boardMapper.commentDelete(Com_Num);
   }
   
   @Override
   public int commentReply(LostComVO comment) {
      BoardMapper boardMapper = 
            sqlSession.getMapper(BoardMapper.class);
      boardMapper.commentReplyupdate(comment);
      comment.setRe_Seq(comment.getRe_Seq()+1);
      comment.setRe_Lev(comment.getRe_Lev()+1);
      
      return 0;
   }

   @Override
   public int replyInsert(replyVO vo) throws Exception {
      BoardMapper boardMapper =
            sqlSession.getMapper(BoardMapper.class);

      return boardMapper.replyInsert(vo);
   }

   @Override
   public List<replyVO> replyList() throws Exception {
      BoardMapper boardMapper = 
            sqlSession.getMapper(BoardMapper.class);
      return boardMapper.replyList();
   }

   @Override
   public int replyDelete(int re_num) throws Exception {
      BoardMapper boardMapper = 
            sqlSession.getMapper(BoardMapper.class);
      return boardMapper.replyDelete(re_num);
   }
   @Override
	public int updatePay(PayVO payvo) {
		BoardMapper boardMapper =
				sqlSession.getMapper(BoardMapper.class);
		int res = boardMapper.updatePay(payvo);
	
		return res;
	}
   @Override
   public int pet_replyInsert(replyVO vo) throws Exception {
      BoardMapper boardMapper =
            sqlSession.getMapper(BoardMapper.class);

      return boardMapper.pet_replyInsert(vo);
   }

   @Override
   public List<replyVO> pet_replyList() throws Exception {
      BoardMapper boardMapper = 
            sqlSession.getMapper(BoardMapper.class);
      return boardMapper.pet_replyList();
   }

   @Override
   public int pet_replyDelete(int re_num) throws Exception {
      BoardMapper boardMapper = 
            sqlSession.getMapper(BoardMapper.class);
      return boardMapper.pet_replyDelete(re_num);
   }
   @Override
   public List<LostComVO> pet_commentList(int Lost_PostNum) throws Exception {
      BoardMapper boardMapper =
            sqlSession.getMapper(BoardMapper.class);

      
      return boardMapper.pet_commentList(Lost_PostNum);
   }

   @Override
   public int pet_commentInsert(LostComVO comment) throws Exception {
      BoardMapper boardMapper =
            sqlSession.getMapper(BoardMapper.class);

      return boardMapper.pet_commentInsert(comment);
   }

   @Override
   public int pet_commentUpdate(LostComVO comment) throws Exception {
      BoardMapper boardMapper =
            sqlSession.getMapper(BoardMapper.class);

      
      return boardMapper.pet_commentUpdate(comment);
   }

   @Override
   public int pet_commentDelete(int Com_Num) throws Exception {
      BoardMapper boardMapper =
            sqlSession.getMapper(BoardMapper.class);

      return boardMapper.pet_commentDelete(Com_Num);
   }

@Override
public int replyUpdate(replyVO vo) throws Exception {
	BoardMapper boardMapper =
            sqlSession.getMapper(BoardMapper.class);

      
      return boardMapper.replyUpdate(vo);
}

@Override
public int pet_replyUpdate(replyVO vo) throws Exception {
	BoardMapper boardMapper =
            sqlSession.getMapper(BoardMapper.class);

      
      return boardMapper.pet_replyUpdate(vo);
}
}