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
		//System.out.println("물품ServiceImpl = " + res);
		
		return res;
	}
	
	@Override
	public List<MemberVO> getPayMember(String id) {
		BoardMapper boardMapper =
				sqlSession.getMapper(BoardMapper.class);
		List<MemberVO> list = boardMapper.getPayMember(id);
		//System.out.println("list"+ list);
		
		return list;
	}
	
	@Override
	public int insertPay(PayVO payVO) {
		//System.out.println("왔니");
		BoardMapper boardMapper =
				sqlSession.getMapper(BoardMapper.class);
		int res = boardMapper.insertPay(payVO);
		//System.out.println("res1111111 = " + res);
		
		return res;
	}
	
	
	@Override
	public int petInsert(PetVO petvo) {
		BoardMapper boardMapper = 
				sqlSession.getMapper(BoardMapper.class);
		int res = boardMapper.petInsert(petvo);
		//System.out.println("동물ServiceImpl = " + res);
		
		return res;
	}
	
	@Override
	public int commentInsert(LostComVO lostcomvo) {
		BoardMapper boardMapper =
				sqlSession.getMapper(BoardMapper.class);
		int res = boardMapper.commentInsert(lostcomvo);
		
		return res;
	}
	
	@Override
	public List<LostComVO> itemCommentList(int Lost_PostNum) {
		BoardMapper boardMapper =
				sqlSession.getMapper(BoardMapper.class);

		List<LostComVO> list = boardMapper.itemCommentList(Lost_PostNum);
		
		return list;
	}
}
