<<<<<<< HEAD
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
		String uploadPath = "/Users/hongmac/Documents/upload/"; 
		
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
	      String uploadPath = "/Users/hongmac/Documents/upload/";
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
		System.out.println("comment"+comment);
		
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

=======
package com.spring.imfind.el.EJ;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.mail.MessagingException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.WebUtils;



import com.spring.imfind.el.EJ.BoardService;

@Controller
public class EJController {
	

	@Autowired
	private BoardService boardService;
	


	
	@RequestMapping("/itemboard")
	public String itemboard() {
		
		return "el/EJ/itemboard";
	}
	
	
	@RequestMapping("/itemInsert")
	public String itemInsert(BoardVO boardvo){
		System.out.println("in");
		boardService.itemInsert(boardvo);
		System.out.println(boardvo.toString());
		
		
		return "el/index";
	}
	
	   @ResponseBody
	   @PostMapping("/profileImage")
	   public void summer_image(MultipartFile file, HttpServletRequest request,
	         HttpServletResponse response) throws Exception {
		   
		   System.out.println("ddddddd");
	      response.setContentType("text/html;charset=utf-8");
	      String uploadPath = "C:\\Users\\gutenLee\\Desktop\\seoul\\upload\\";
	      //String uploadPath = "/Users/hongmac/Documents/WebProject/ImFind/src/main/webapp/resources/el/images/";
	      
	      
	      PrintWriter out = response.getWriter();
	      String originalFileExtension = file.getOriginalFilename(); 
	      String storedFileName = UUID.randomUUID().toString().replaceAll("-", "");// + originalFileExtension

	      System.out.println("storedFileName : " + storedFileName);
	      file.transferTo(new File(uploadPath+storedFileName));
	      out.println("/imfind/upload/"+storedFileName);
	      out.close();

	   }

	
	@RequestMapping(value="el/paymember", method=RequestMethod.POST, produces="application/json;charset=UTF-8")
	@ResponseBody
	public List<MemberVO> getMemberPay(
			@RequestParam(value="id") String id){
		System.out.println("떠라");
		List<MemberVO> list = boardService.getPayMember(id);
		
		System.out.println("list" + list);
		
		return list;
	}
	   
	@RequestMapping(value="el/insertPay", method=RequestMethod.POST, produces="application/json;charset=UTF-8")
	@ResponseBody
	public int insertPay(@RequestBody Map<String, String> vo){
		System.out.println("떠라2222222");
		
		PayVO payVO = new PayVO();
		payVO.setPayCode((vo.get("PayCode")));
		payVO.setPay_Way((vo.get("Pay_Amount")));
		payVO.setPay_Amount(Integer.parseInt(vo.get("Pay_Amount")));
		payVO.setPay_State((vo.get("Pay_State")));
		payVO.setPay_Date((vo.get("Pay_Date")));
		
		int res = boardService.insertPay(payVO);
		System.out.println(res);
		System.out.println("payVO==========" + payVO);
		
		return res;
	}
	
	@RequestMapping("/petboard")
	public String petboard() {
		
		return "el/EJ/petboard";

	}
	
	@RequestMapping("el/petInsert")
	public String petInsert(PetVO petvo){
		System.out.println("in");
		boardService.petInsert(petvo);
		System.out.println(petvo.toString());
		
		
		return "el/index";
	}
	/*
	 은지 - 게시판 등록 끝
	 */
	
	/*
	 은지 댓글 시작 
	 */
	
	@RequestMapping("/comment")
	public String comment() { 
		
		return "el/EJ/comment"; 
	}
	
	@RequestMapping(value = "el/comInsert",
			produces="application/json;charset=UTF-8")
	public int commentInsert(LostComVO lostcomvo) {
		
		System.out.println("댓글 in");
		System.out.println(lostcomvo.toString());
		int res = boardService.commentInsert(lostcomvo);
		
		return res;
	}
	
	@RequestMapping(value="el/commentlist",
			produces="application/json;charset=UTF-8")
	public List<LostComVO> itemCommentList(@RequestParam int Lost_PostNum){
		List<LostComVO> comment_list = boardService.itemCommentList(Lost_PostNum);
		
		return comment_list;
	}
	
	/* 
	  은지 댓글 끝
	 */




>>>>>>> dd989063f89186c6b2e1561ca33d1f1d7ef91ae8
}