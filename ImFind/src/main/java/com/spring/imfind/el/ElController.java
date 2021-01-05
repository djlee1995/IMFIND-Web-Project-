package com.spring.imfind.el;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.spring.imfind.el.YH.KakaoController;
import com.spring.imfind.el.YH.MemberService;
import com.spring.imfind.el.YH.MemberVO;
import com.spring.imfind.el.YH.OpenBanking;

@Controller
@SessionAttributes({"kakao_id", "id"})
public class ElController {
	
	@Autowired
	private MemberService memberService;
	

	
	@RequestMapping("/index")
	public String index2() {
		
		return "el/index";
	}
	
	// header include 
	@RequestMapping("el/header")
	public String header() {
		
		return "el/header";
	}
	
	// login - ����
	@RequestMapping("/login")
	public String login() {
		
		return "el/login";
	}
	// logout - ����
	@RequestMapping("/logout")
	public String logout(SessionStatus status) {
		
		System.out.println("logout call");
		
		status.setComplete(); // session �����Ű��
		
		if(status.isComplete()) {
			System.out.println("���� ���� ����");
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
			model.addAttribute("id", id);
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
	public String oauthKakao(HttpServletRequest request,  Model model, String code) throws Exception{
		
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
        	return "/register";
        }
	}
	// ���������� ���¹�ŷ get code
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
		vo.setContact(vo.getContact().replaceAll("=", ""));
		memberService.insertMember(vo);
		return "el/index";
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
	
	@RequestMapping("/register")
	public String register() {
		
		return "el/register";
	}
	

	
}