package com.spring.imfind.el;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

import javax.mail.MessagingException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import java.io.File;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import org.springframework.web.util.WebUtils;

import com.spring.imfind.el.YH.EmailSend;
import com.spring.imfind.el.YH.KakaoController;
import com.spring.imfind.el.YH.MemberService;
import com.spring.imfind.el.YH.LoginDTO;
import com.spring.imfind.el.YH.OpenBanking;
import com.spring.imfind.el.YH.Tempkey;

import org.springframework.web.multipart.MultipartFile;

import com.spring.imfind.el.EJ.BoardService;
import com.spring.imfind.el.EJ.BoardVO;
import com.spring.imfind.el.EJ.MemberVO;
import com.spring.imfind.el.EJ.PayVO;
import com.spring.imfind.el.EJ.PetVO;


@Controller
public class ElController {
	
	@Autowired

	JavaMailSender mailSender;
	
	@Autowired
	EmailSend mailSend;
	
	@Autowired
	private MemberService memberService;

	// - ����
	private BoardService boardService;

	@RequestMapping("/index")
	public String index2() { return "el/index"; }
	
	@RequestMapping("/home2")
	public String index3() { return "home2"; }
	
	// header include - ����
	@RequestMapping("el/header")
	public String header() { return "el/header"; }
	// header include - ����
	@RequestMapping("el/afterLoginHeader")
	public String afterLoginHeader() { return "el/afterLoginHeader"; }
	
	// ȸ������ ����
	@RequestMapping("/register")
	public String register() { return "el/register"; }
	
	// login - ����
	@RequestMapping("/login")
	public String login() { return "el/login"; }
	
	// logout - ����
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		
		System.out.println("logout call");
		
		HttpSession session = request.getSession();
		
		String loginUser = (String)session.getAttribute("loginUser");
		String kakaoLoginUser = (String)session.getAttribute("kakaoLoginUser");
		
		if(loginUser != null) {
			session.removeAttribute("loginUser");
		}
		else if(kakaoLoginUser != null) {
			session.removeAttribute("kakaoLoginUser");
		}
		
		Cookie loginCookie = WebUtils.getCookie(request, "login_cookie");
		
		if(loginCookie != null) {
			loginCookie.setPath("/");
			loginCookie.setMaxAge(0);
			response.addCookie(loginCookie);
		}
		
		return "redirect:/index";
	}
	/*
	 * �Ϲ� �α��� id, pw üũ - ����
	 * */
	@RequestMapping("/loginCheck")
	@ResponseBody
	public String loginCheck(@RequestParam(value="id") String id, @RequestParam(value="pw") String pw, HttpServletRequest request) {
		
		System.out.println("login in");
		System.out.println(id);
		
		int state = memberService.loginCheck(id, pw);
		
		if(state == 1) {
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", id); //d
			return "pass";
		}
		else {
			return "unpass";
		}
	}
	
	// īī�� �α���â ȣ��
	@RequestMapping(value = "/el/getKakaoAuthUrl", method = RequestMethod.POST)
	public @ResponseBody String getKakaoAuthUrl(HttpServletRequest request, Model model) throws Exception{

		final String K_CLIENT_ID = "d5e7c97eeecbba70fa5f4e5f4bc57517";
		final String K_REDIRECT_URI = "http://localhost:8080/imfind/login/oauth_kakao";

		String kakaoUrl = "https://kauth.kakao.com/oauth/authorize?"
				+ "client_id=" + K_CLIENT_ID
				+ "&redirect_uri=" + K_REDIRECT_URI
				+ "&response_type=code";
		
		System.out.println("kakao url " + kakaoUrl);
		return kakaoUrl;
	}
	
	// īī������ �� access_token
	@RequestMapping(value="/login/oauth_kakao")
	public String oauthKakao(HttpServletRequest request, String code) throws Exception{
		
		HttpSession session = request.getSession();
		
		KakaoController kakao = new KakaoController();
	
		String access_token = kakao.getAccessToken(code);
		
		Map<String, Object> userInfo = kakao.getUserInfo(access_token);
        Map<String, String> properties = (Map<String, String>) userInfo.get("properties"); // �г���, ������ ���� �������        
        Map<String, Object> kakao_account = (Map<String, Object>) userInfo.get("kakao_account"); // �̸��� �������
        
        String kakao_id = Integer.toString((int) userInfo.get("id"));
        
        System.out.println("kakao_id : " + kakao_id);
        
        String email = (String) kakao_account.get("email");
        session.setAttribute("kakaoLoginUser", kakao_id);
        return "redirect:/index";
	}
	
	// ���������� ���¹�ŷ ���� url
	@RequestMapping(value="/getAuthorize")
	public @ResponseBody String openBanking() {
		System.out.println("���¹�ŷ in");
		 
		OpenBanking bank = new OpenBanking();
		String reqUrl = bank.getAuthorize();
		System.out.println(reqUrl);
		
		return reqUrl;
	}
	// ���������� 3-legged ���� get code
	@RequestMapping(value="/getOpenBankingToken")
	public String getOpenBankingToken(String code, String access_token) throws Exception{
		
		System.out.println("account : " + code);
		System.out.println("���¹�ŷ token in");

		OpenBanking bank = new OpenBanking();
		bank.getToken(code);
		
		return "forward:/register";
	}
	// ���������� 2 legged get code
	@RequestMapping(value="/getToken")
	public @ResponseBody String getToken(@RequestBody Map<String, String> map) throws Exception{

		System.out.println("���¹�ŷ ���½Ǹ���ȸ in");
		
		String account = map.get("account");
		String birth = map.get("birth");
		
		
		OpenBanking bank = new OpenBanking();
		String access_token = bank.leggedToken();
		
		bank.getAccountInfo(map, access_token);
		
		return "register";
	}
	@RequestMapping("/kakaoRegister")
	public String kakaoRegister() { return "el/kakaoRegister"; }
	
	@RequestMapping("/chkID")
	public @ResponseBody String chkID(@RequestParam String id) {
		
		System.out.println(id);
		int state = memberService.CheckID(id);
		
		if(state == 1) {
			return "ok";
		}
		else {
			return "id exists";
		}
	}
	
	
	@RequestMapping("/processJoin")
	public String processJoin(LoginDTO vo) { // vo 이름 변경
		
		System.out.println(vo.toString());
		vo.setAccount_holder(vo.getName());
		memberService.insertMember(vo);
		
		return "redirect:/";
	}
	
	@RequestMapping(value="/findIDAuth", method = RequestMethod.POST)
	public @ResponseBody Map<String, String>  emailAuth(Model model, @RequestBody Map<String, String> map) throws IOException, MessagingException {
		
		String res = memberService.findID(map.get("name"), map.get("email"));
		
		Map<String, String> resJson = new HashMap<String, String>();
		
		if(res != null) {
			resJson.put("res", "ok");
			
			final int CODE = mailSend.sendFindIDCode(map.get("email"));

			resJson.put("code", Integer.toString(CODE));
			resJson.put("findID", res);
			resJson.put("email", map.get("email"));
		}
		else {
			resJson.put("res", "fail");
		}
		return resJson;
	}
	
	@RequestMapping(value="/findPWAuth", method = RequestMethod.POST)
	public @ResponseBody Map<String, String>  findPWAuth(HttpServletRequest request, HttpServletResponse response, 
			@RequestBody Map<String, String> map) throws IOException, MessagingException {
		
		LoginDTO vo = memberService.findPW(map.get("id"), map.get("email")); // vo 이름 변경
		
		Map<String, String> resJson = new HashMap<String, String>();
		if(vo != null) {
			resJson.put("res", "ok");

			final int CODE = mailSend.sendFindPWCode(map.get("email"));
			resJson.put("code", Integer.toString(CODE));
			resJson.put("email", map.get("email"));
			resJson.put("id", vo.getId());
		}
		else {
			resJson.put("res", "fail");
		}
		return resJson;
	}
	
	@RequestMapping(value="/sendUserPW", method = RequestMethod.POST)
	public @ResponseBody String sendUserPW(@RequestParam("email") String email, @RequestParam("id") String id) throws UnsupportedEncodingException, MessagingException {
		
		System.out.println("�������� ��й��� + " + email);
		System.out.println("���� ���� ���̵�" + id);
	    final String tempPW = new Tempkey().getKey(8, false); 
	    
	    int res = memberService.alterTempPW(id, tempPW);
	    if(res == 1) {
	    	System.out.println("���������������������������������������������������������������������� " + tempPW);
	    	mailSend.sendUserPW(email, tempPW);
	    	return "ok";
	    }
	    return "fail"; 
	}
	
	
	@RequestMapping(value="/sendUserID", method = RequestMethod.POST)
	public @ResponseBody String sendUserID(@RequestParam("email") String email, @RequestParam("id") String id) throws UnsupportedEncodingException, MessagingException {
		System.out.println(email);
		
		mailSend.sendUserID(email, id);
		
		return "";
	}
	
	
	@RequestMapping("/shop")
	public String shop() {
		
		return "el/shop"; }

	/*
	
	 은지 - 게시판 등록
	
	 */
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
	      String uploadPath = "/Users/hongmac/Documents/upload/";
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
	
	@RequestMapping("/petInsert")
	public String petInsert(PetVO petvo){
		System.out.println("in");
		boardService.petInsert(petvo);
		System.out.println(petvo.toString());
		
		
		return "el/index";
	}
	/*
	 은지 - 게시판 등록
	 */
	
	// header include 
  
	@RequestMapping("/collection")
	public String collection() {
		
		return "el/collection";
	}
	
	@RequestMapping("/blog")
	public String blog() {
		
		return "el/blog";
	}
	
	@RequestMapping("/contact")
	public String contact() {
		
		return "el/contact";
	}
	
	@RequestMapping("/shopping-cart")
	public String shoppingcart() {
		
		return "el/shopping-cart";
	}
	
	@RequestMapping("/main")
	public String main() {
		
		return "el/main";
	}
	
	@RequestMapping("/blog-details")
	public String blogdetails() {
		
		return "el/blog-details";
	}
	
	@RequestMapping("/chek-out")
	public String chekout() {
		
		return "el/chek-out";
	}
	
	@RequestMapping("/faq")
	public String faq() {
		
		return "el/faq";
	}

	


}