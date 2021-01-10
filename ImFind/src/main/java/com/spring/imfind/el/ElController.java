package com.spring.imfind.el;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.Map;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.spring.imfind.el.YH.EmailSend;
import com.spring.imfind.el.YH.KakaoController;
import com.spring.imfind.el.YH.MemberService;
import com.spring.imfind.el.YH.MemberVO;
import com.spring.imfind.el.YH.OpenBanking;
import com.spring.imfind.el.YH.Tempkey;

@Controller
@SessionAttributes({"kakao_id", "id"})
public class ElController {
	
	@Autowired
	JavaMailSender mailSender;
	
	@Autowired
	EmailSend mailSend;
	
	@Autowired
	private MemberService memberService;
	
	// - ����
	@RequestMapping("/index")
	public String index2() { return "el/index"; }
	
	// header include - ����
	@RequestMapping("el/header")
	public String header() { return "el/header"; }
	
	// ȸ������ ����
	@RequestMapping("/register")
	public String register() { return "el/register"; }
	
	// login - ����
	@RequestMapping("/login")
	public String login() { return "el/login"; }
	
	// logout - ����
	@RequestMapping("/logout")
	public String logout(SessionStatus status) {
		
		System.out.println("logout call");
		
		status.setComplete(); // session �����Ű��
		status.toString();
		
		if(status.isComplete()) {
			System.out.println("���� ���� ����");

			return "redirect:/index";
		}
		else {
			System.out.println("���� ���� ����");
		}
		
		return "el/index";
	}
	/*
	 * �Ϲ� �α��� id, pw üũ - ����
	 * */
	@RequestMapping("/loginCheck")
	@ResponseBody
	public String loginCheck(@RequestParam(value="id") String id, @RequestParam(value="pw") String pw, Model model) {
		
		System.out.println("login in");
		System.out.println(id);
		System.out.println(pw);
		
		int state = memberService.loginCheck(id, pw);
		
		if(state == 1) {
			model.addAttribute("id", id); // id ���� ����
			return "pass";
		}
		else {
			return "unpass";
		}
	}
	
	// īī�� �α���â ȣ��
	@RequestMapping(value = "/el/getKakaoAuthUrl")
	public @ResponseBody String getKakaoAuthUrl(HttpServletRequest request) throws Exception{

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
	public String oauthKakao(HttpSession session,  Model model, String code) throws Exception{
		
		System.out.println("code : " + code);
		
		KakaoController kakao = new KakaoController();
	
		String access_token = kakao.getAccessToken(code);
		
		Map<String, Object> userInfo = kakao.getUserInfo(access_token);
        Map<String, String> properties = (Map<String, String>) userInfo.get("properties"); // �г���, ������ ���� �������        
        Map<String, Object> kakao_account = (Map<String, Object>) userInfo.get("kakao_account"); // �̸��� �������
        
        String kakao_id = Integer.toString((int) userInfo.get("id"));
        String email = (String) kakao_account.get("email");
        
        model.addAttribute("kakao_id", kakao_id);
        int res = memberService.kakaoLoginCheck(kakao_id);
        
        if(res == 1) {
        	return "redirect:/index";
        }
        else {
        	// db�� ���̵� ������ �߰� ���� �Է��� ���� ȸ������ �������� �̵�.
        	return "el/kakaoJoin";
        }
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
	public String processJoin(MemberVO vo) {
		
		System.out.println(vo.toString());
		vo.setAccount_holder(vo.getName());
		memberService.insertMember(vo);
		
		return "el/index";
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
		
		MemberVO vo = memberService.findPW(map.get("id"), map.get("email"));
		
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
		
		return "el/shop"; 
	}
	
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