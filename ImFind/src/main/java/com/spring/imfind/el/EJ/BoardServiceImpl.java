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
}
