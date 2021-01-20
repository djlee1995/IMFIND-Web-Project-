package com.spring.imfind.el.EJ;

import java.io.File;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class EJController {
	
	@Autowired
	private BoardService boardService;	

	@RequestMapping("/itemboard")
	public String itemboard() {
		
		return "el/EJ/itemboard";
	}
	
	@RequestMapping("/itemInsert")
	public String itemInsert(BoardVO boardvo) {
		Pattern pattern  =  Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>"); // 이미지태그 자르기
		String content = boardvo.getLost_Content();
		Matcher match = pattern.matcher(content);
		String Lost_Up_File = null;
		String uploadPath = "C:\\Project\\WebProject\\upload\\";
		
		if(match.find()){ 
			Lost_Up_File = match.group(0); 
		}
		boardvo.setLost_Up_File(Lost_Up_File); // 이미지 태그 Lost_Up_File에 삽입
		//Lost_Content부분에 있는 태그들 자르기
	    boardvo.setLost_Content(boardvo.getLost_Content().replaceAll("<(/)?([a-zA-Z]*)(\\\\s[a-zA-Z]*=[^>]*)?(\\\\s)*(/)?>", ""));
	    String replace1 = boardvo.getLost_Content().replaceAll("<(/)?([a-zA-Z]*)(\\\\s[a-zA-Z]*=[^>]*)?(\\\\s)*(/)?>", "");
	    String replace2 = replace1.replaceAll("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>", "");
	   
	    boardvo.setLost_Content(replace2);
	    boardService.itemInsert(boardvo);
	     
	     return "redirect:/item";		
	}
	
	//썸머노트 이미지 업로드
	@ResponseBody
	   @PostMapping("/profileImage")
	   public void summer_image(MultipartFile file, HttpServletRequest request,
	         HttpServletResponse response) throws Exception {
		 
	      response.setContentType("text/html;charset=utf-8");
	      String uploadPath = "C:\\Project\\WebProject\\upload\\";
	      PrintWriter out = response.getWriter();
          String storedFileName = UUID.randomUUID().toString().replaceAll("-", "");
          
          file.transferTo(new File(uploadPath+storedFileName));
          out.println("/imfind/upload/"+storedFileName);
          out.close();
          
	   }
   
   
	@RequestMapping(value="el/paymember", method=RequestMethod.POST, produces="application/json;charset=UTF-8")
	@ResponseBody
	public List<MemberVO> getMemberPay(@RequestParam(value="id") String id){
		List<MemberVO> list = boardService.getPayMember(id);
		
		return list;
	}
	   
	@RequestMapping(value="el/insertPay", method=RequestMethod.POST, produces="application/json;charset=UTF-8")
	@ResponseBody
	public int insertPay(@RequestBody Map<String, String> vo){
		
		PayVO payVO = new PayVO();
		payVO.setPayCode((vo.get("PayCode")));
		payVO.setPay_Way((vo.get("Pay_Amount")));
		payVO.setPay_Amount(Integer.parseInt(vo.get("Pay_Amount")));
		payVO.setPay_State((vo.get("Pay_State")));
		payVO.setPay_Date((vo.get("Pay_Date")));
		payVO.setId(vo.get("Id"));
		int res = boardService.insertPay(payVO);
		
		return res;
	}
	
	@RequestMapping("/petboard")
	public String petboard() {
		
		return "el/EJ/petboard";

	}
	
	@RequestMapping("el/petInsert")
	public String petInsert(PetVO petvo){
		boardService.petInsert(petvo);
		
		return "el/index";
	}
	/* 은지 - 게시판 등록 끝 */
	
	/* 은지 댓글 시작  */
	@ResponseBody
	@RequestMapping(value="/comment_list",
			produces="application/json;charset=UTF-8")
	private List<LostComVO> commentList(@RequestParam int Lost_PostNum) throws Exception{
		List<LostComVO> comment_list = boardService.commentList(Lost_PostNum);
		
		
		return comment_list;
	}
	
	@ResponseBody
	@RequestMapping(value="/comment_insert",
			produces="application/json;charset=UTF-8")
	private int commentInsert(LostComVO comment, HttpSession session) throws Exception{
		comment.setId((String)session.getAttribute("loginUser"));
	
		
			if ( comment.getSecret_Com() == null) { // 댓글 공개 설정
				comment.setSecret_Com("n");
			}
	
		return boardService.commentInsert(comment);
	}
	

	@ResponseBody
	@RequestMapping(value="/comment_update",
			produces="application/json;charset=UTF-8")
	private int commentUpdate(LostComVO comment) throws Exception{
		
		return boardService.commentUpdate(comment);
	}
	@ResponseBody
	@RequestMapping(value="/comment_delete",
			produces="application/json;charset=UTF-8")
	private int commentDelete(@RequestParam(value="Com_Num") int Com_Num) throws Exception{
		return boardService.commentDelete(Com_Num);
	}
	
	/* 은지 댓글 끝  */
	
	@RequestMapping("/recomment.html")
	public String map() {
		
		return "el/EJ/recomment";
	}
	/*
	@RequestMapping("/commentreplyform") 
	public String commentReplyForm(@RequestParam(value="Re_Com_Num", required=true) int Re_Com_Num, Model model) {
		//BoardVO vo = boardService. .getDetail(Re_Com_Num);
		
		//model.addAttribute("vo", Re_Com_Num);
		
		return "board/qna_board_reply";
	}
	*/
	@RequestMapping("/commentReply") 
	public String commentReply(LostComVO comment) throws Exception {
		int res = boardService.commentReply(comment);
		
		return "redirect:/el/MJ/iteminfo";
	}
}