package com.spring.imfind.el.EJ;

import java.io.File;
import java.io.PrintWriter;
import java.util.HashMap;
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
	public String itemInsert(BoardVO boardvo) throws Exception {
		Pattern pattern = Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>"); // 이미지태그 자르기
		String content = boardvo.getLost_Content();
		Matcher match = pattern.matcher(content);
		String Lost_Up_File = null;
		// String uploadPath = "/Users/hongmac/Documents/upload/";
		// String uploadPath = "C:\\JavaTPC\\WebProject\\upload\\";
		String uploadPath = "C:\\Project\\WebProject\\upload\\";

		if (match.find()) {
			Lost_Up_File = match.group(0);
		}
		// if(pattern)
		boardvo.setLost_Up_File(Lost_Up_File); // 이미지 태그 Lost_Up_File에 삽입

		if (boardvo.getLost_Up_File() == null) {
			String noimg = "0";
			boardvo.setLost_Up_File(noimg);

		}

		// Lost_Content부분에 있는 태그들 자르기
		boardvo.setLost_Content(boardvo.getLost_Content()
				.replaceAll("<(/)?([a-zA-Z]*)(\\\\\\\\s[a-zA-Z]*=[^>]*)?(\\\\\\\\s)*(/)?>", ""));
		String replace1 = boardvo.getLost_Content()
				.replaceAll("<(/)?([a-zA-Z]*)(\\\\\\\\s[a-zA-Z]*=[^>]*)?(\\\\\\\\s)*(/)?>", "");
		String replace2 = replace1.replaceAll("<img[^>]*src=[\\\"']?([^>\\\"']+)[\\\"']?[^>]*>", "");
		boardvo.setLost_Content(replace2);

		if (boardvo.getLost_Pay() == null) {
			String replace4 = "0";
			boardvo.setLost_Pay(replace4);
		}

		if (boardvo.getLost_Pay() != null) {
			String replace3 = boardvo.getLost_Pay().replaceAll(",", "");
			boardvo.setLost_Pay(replace3);
		}

		// YH
		try {
			boardService.itemInsert(boardvo);
			BoardVO postNum = boardService.getPostNum(boardvo);
			boardvo.setLost_PostNum(postNum.getLost_PostNum());
			boardService.addPayBoardNum(boardvo);
		} catch (Exception e) {

		}

		return "redirect:/item";
	}

	// 썸머노트 이미지 업로드
	@ResponseBody
	@PostMapping("/profileImage")
	public void summer_image(MultipartFile file, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		response.setContentType("text/html;charset=utf-8");
		// String uploadPath = "/Users/hongmac/Documents/upload/";
		// String uploadPath = "C:\\JavaTPC\\WebProject\\upload\\";
		String uploadPath = "C:\\Project\\WebProject\\upload\\";
		PrintWriter out = response.getWriter();
		String storedFileName = UUID.randomUUID().toString().replaceAll("-", "");

		file.transferTo(new File(uploadPath + storedFileName));
		out.println("/imfind/upload/" + storedFileName);
		out.close();

	}

	@RequestMapping(value = "el/paymember", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<MemberVO> getMemberPay(@RequestParam(value = "id") String id) {
		List<MemberVO> list = boardService.getPayMember(id);

		return list;
	}

	@RequestMapping(value = "el/insertPay", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public int insertPay(@RequestBody Map<String, String> vo) {
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

	@RequestMapping("petInsert")
	public String petInsert(PetVO petvo) throws Exception {
		Pattern pattern = Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>"); // 이미지태그 자르기
		String content = petvo.getPet_Content();
		Matcher match = pattern.matcher(content);
		String pet_Up_File = null;
		// String uploadPath = "/Users/hongmac/Documents/upload/";
		String uploadPath = "C:\\Project\\WebProject\\upload\\";

		if (match.find()) {
			pet_Up_File = match.group(0);
		}
		// if(pattern)
		petvo.setPet_Up_File(pet_Up_File); // 이미지 태그 Lost_Up_File에 삽입

		if (petvo.getPet_Up_File() == null) {
			String noimg = "0";
			petvo.setPet_Up_File(noimg);

		}
		// pet_Content부분에 있는 태그들 자르기
		petvo.setPet_Content(
				petvo.getPet_Content().replaceAll("<(/)?([a-zA-Z]*)(\\\\s[a-zA-Z]*=[^>]*)?(\\\\s)*(/)?>", ""));
		String replace1 = petvo.getPet_Content().replaceAll("<(/)?([a-zA-Z]*)(\\\\s[a-zA-Z]*=[^>]*)?(\\\\s)*(/)?>", "");
		String replace2 = replace1.replaceAll("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>", "");
		// String replace3 = petvo.getPet_Pay().replaceAll(",", ""); // pay
		String replace4 = petvo.getPet_Name().replaceAll("있음,", ""); // name
		petvo.setPet_Content(replace2);
		// petvo.setPet_Pay(replace3);
		petvo.setPet_Name(replace4);

		if (petvo.getPet_Pay() == null) {
			String replace5 = "0";
			petvo.setPet_Pay(replace5);
		}

		if (petvo.getPet_Pay() != null) {
			String replace6 = petvo.getPet_Pay().replaceAll(",", "");
			petvo.setPet_Pay(replace6);
		}
		try {
			boardService.petInsert(petvo);
			PetVO postNum = boardService.getPetPostNum(petvo);
			petvo.setPet_PostNum(postNum.getPet_PostNum());
			boardService.addPayPetBoardNum(petvo);
		} catch (Exception e) {

		}

		return "redirect:/pet";
	}
	/* 은지 - 게시판 등록 끝 */

	/* 은지 댓글 시작 */
	@ResponseBody
	@RequestMapping(value = "/comment_list", produces = "application/json;charset=UTF-8")
	private List<LostComVO> commentList(@RequestParam int Lost_PostNum) throws Exception {
		List<LostComVO> comment_list = boardService.commentList(Lost_PostNum);

		return comment_list;
	}

	@ResponseBody
	@RequestMapping(value = "/comment_insert", produces = "application/json;charset=UTF-8")
	private int commentInsert(LostComVO comment, HttpSession session) throws Exception {
		comment.setId((String) session.getAttribute("loginUser"));

		if (comment.getSecret_Com() == null) { // 댓글 공개 설정
			comment.setSecret_Com("n");
		}

		return boardService.commentInsert(comment);
	}

	@ResponseBody
	@RequestMapping(value = "/comment_update", produces = "application/json;charset=UTF-8")
	private int commentUpdate(LostComVO comment) throws Exception {

		return boardService.commentUpdate(comment);
	}

	@ResponseBody
	@RequestMapping(value = "/comment_delete", produces = "application/json;charset=UTF-8")
	private int commentDelete(@RequestParam(value = "Com_Num") int Com_Num) throws Exception {
		return boardService.commentDelete(Com_Num);
	}

	/* 은지 댓글 끝 */

	@RequestMapping("/recomment.html")
	public String map() {

		return "el/EJ/recomment";
	}

	@RequestMapping("/commentReply")
	public String commentReply(LostComVO comment) throws Exception {
		int res = boardService.commentReply(comment);

		return "boardService.commentInsert(comment)";
	}

	@RequestMapping(value = "el/refund", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")

	@ResponseBody
	public int refund(@RequestBody HashMap<String, String> map) {
		String pay_State = "refund";
		PayVO payVO = new PayVO();
		payVO.setId(map.get("Id"));
		payVO.setPayCode(map.get("PayCode"));
		payVO.setPay_State(pay_State);

		int res = boardService.updatePay(payVO);

		return res;
	}

	/* 동준 대댓글 시작 */
	@ResponseBody
	@RequestMapping(value = "/replylist", produces = "application/json;charset=UTF-8")
	private List<replyVO> replyList() throws Exception {
		List<replyVO> reply_list = boardService.replyList();

		return reply_list;
	}

	@ResponseBody
	@RequestMapping(value = "/reply_update", produces = "application/json;charset=UTF-8")
	private int replyUpdate(replyVO vo) throws Exception {

		return boardService.replyUpdate(vo);
	}

	@ResponseBody
	@RequestMapping(value = "/reply_insert", produces = "application/json;charset=UTF-8")
	private int replyInsert(replyVO vo, HttpSession session) throws Exception {
		vo.setId((String) session.getAttribute("loginUser"));

		return boardService.replyInsert(vo);
	}

	@ResponseBody
	@RequestMapping(value = "/reply_delete", produces = "application/json;charset=UTF-8")
	private int replydelete(@RequestParam(value = "re_num") int re_num) throws Exception {

		return boardService.replyDelete(re_num);
	}

	/* 동준 대댓글 끝 */
	/* 동준 대댓글 시작 */
	@ResponseBody
	@RequestMapping(value = "/pet_replylist", produces = "application/json;charset=UTF-8")
	private List<replyVO> pet_replyList() throws Exception {
		List<replyVO> reply_list = boardService.pet_replyList();

		return reply_list;
	}

	@ResponseBody
	@RequestMapping(value = "/pet_reply_insert", produces = "application/json;charset=UTF-8")
	private int pet_replyInsert(replyVO vo, HttpSession session) throws Exception {
		vo.setId((String) session.getAttribute("loginUser"));

		return boardService.pet_replyInsert(vo);
	}

	@ResponseBody
	@RequestMapping(value = "/pet_reply_delete", produces = "application/json;charset=UTF-8")
	private int pet_replydelete(@RequestParam(value = "re_num") int re_num) throws Exception {

		return boardService.pet_replyDelete(re_num);
	}

	@ResponseBody
	@RequestMapping(value = "/pet_reply_update", produces = "application/json;charset=UTF-8")
	private int pet_replyUpdate(replyVO vo) throws Exception {

		return boardService.pet_replyUpdate(vo);
	}

	/* 동준 대댓글 끝 */
	@ResponseBody
	@RequestMapping(value = "/pet_comment_list", produces = "application/json;charset=UTF-8")
	private List<LostComVO> pet_commentList(@RequestParam int Lost_PostNum) throws Exception {
		List<LostComVO> comment_list = boardService.pet_commentList(Lost_PostNum);

		return comment_list;
	}

	@ResponseBody
	@RequestMapping(value = "/pet_comment_insert", produces = "application/json;charset=UTF-8")
	private int pet_commentInsert(LostComVO comment, HttpSession session) throws Exception {
		comment.setId((String) session.getAttribute("loginUser"));

		if (comment.getSecret_Com() == null) { // 댓글 공개 설정
			comment.setSecret_Com("n");
		}

		return boardService.pet_commentInsert(comment);
	}

	@ResponseBody
	@RequestMapping(value = "/pet_comment_update", produces = "application/json;charset=UTF-8")
	private int pet_commentUpdate(LostComVO comment) throws Exception {

		return boardService.pet_commentUpdate(comment);
	}

	@ResponseBody
	@RequestMapping(value = "/pet_comment_delete", produces = "application/json;charset=UTF-8")
	private int pet_commentDelete(@RequestParam(value = "Com_Num") int Com_Num) throws Exception {
		return boardService.pet_commentDelete(Com_Num);
	}

	/* 은지 마이페이지 댓글리스트 */
	@ResponseBody
	@RequestMapping(value = "/getCommentList", produces = "application/json;charset=UTF-8")
	public List<ComVO> getCommentList(@RequestParam(value = "id") String id) {
		List<ComVO> commentList = boardService.getCommentList(id);

		return commentList;
	}

	@ResponseBody
	@RequestMapping(value = "/getPetCommentList", produces = "application/json;charset=UTF-8")
	public List<ComVO> getPetCommentList(@RequestParam(value = "id") String id) {
		List<ComVO> commentList = boardService.getPetCommentList(id);

		return commentList;
	}

	// 회원탈퇴
	@RequestMapping("/delete")
	public String delete() {

		return "el/EJ/deletepage";
	}

	@ResponseBody
	@RequestMapping(value = "/deleteMember")
	private Map<String, String> deleteMember(MemberVO membervo) throws Exception {

		Map<String, String> map = new HashMap<String, String>();
		int res = boardService.deleteMember(membervo);

		if (res == 1) {
			map.put("res", "success");
			return map;
		} else {
			map.put("res", "fail");
			return map;
		}

	}

}