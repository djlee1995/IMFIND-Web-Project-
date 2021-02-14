
package com.spring.imfind.el.YH;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.WebUtils;

import com.spring.imfind.el.YS.ElVO;

@Controller
public class YHController {

	@RequestMapping("/NewHeader_CSS")
	public String NewHeader_CSS() {
		return "el/NewHeader_CSS";
	}

	@RequestMapping("/NewFooter_JS")
	public String NewFooter_JS() {
		return "el/NewFooter_JS";
	}

	@Autowired
	JavaMailSender mailSender;

	@Autowired
	EmailSend mailSend;
	
	@Autowired
	AlarmService alarmService;

	// 유희
	@Autowired
	private MemberService memberService;

	// header include -
	@RequestMapping("el/header")
	public String header() {
		return "el/NewHeader";
	}

	@RequestMapping("el/mainJS")
	public String getJS() {
		return "home/NewFooter_JS";
	}

	// header include -
	@RequestMapping("el/afterLoginHeader")
	public String afterLoginHeader() {
		return "el/afterLoginHeader";
	}

	@RequestMapping("/clause")
	public String clause() {
		return "el/YS/clause";
	}

	//
	@RequestMapping("/register")
	public String register() {
		return "el/register";
	}

	// login -
	@RequestMapping("/login")
	public String login() {
		return "el/login";
	}

	// logout -
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession();

		String loginUser = (String) session.getAttribute("loginUser");
		String kakaoLoginUser = (String) session.getAttribute("kakaoLoginUser");

		session.removeAttribute("loginUser");
		session.removeAttribute("kakaoLoginUser");

		if (loginUser != null) {
			session.removeAttribute("loginUser");
		}
		if (kakaoLoginUser != null) {
			session.removeAttribute("kakaoLoginUser");
		}

		Cookie loginCookie = WebUtils.getCookie(request, "login_cookie");

		if (loginCookie != null) {
			loginCookie.setPath("/");
			loginCookie.setMaxAge(0);
			response.addCookie(loginCookie);
		}

		return "redirect:/";
	}

	/*
	 * 아이디 id, pw
	 */
	@RequestMapping("/loginCheck")
	@ResponseBody
	public String loginCheck(@RequestParam(value = "id") String id, @RequestParam(value = "pw") String pw,
			HttpServletRequest request) {

		int state = memberService.loginCheck(id, pw);

		if (state == 1) {
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", id); // d
			return "pass";
		} else {
			return "unpass";
		}
	}

	//
	@RequestMapping(value = "/el/getKakaoAuthUrl", method = RequestMethod.POST)
	public @ResponseBody String getKakaoAuthUrl(HttpServletRequest request, Model model) throws Exception {

		final String K_CLIENT_ID = "d5e7c97eeecbba70fa5f4e5f4bc57517";
		final String K_REDIRECT_URI = "http://localhost:8080/imfind/login/oauth_kakao";

		String kakaoUrl = "https://kauth.kakao.com/oauth/authorize?" + "client_id=" + K_CLIENT_ID + "&redirect_uri="
				+ K_REDIRECT_URI + "&response_type=code";

		return kakaoUrl;
	}

	// access_token
	@RequestMapping(value = "/login/oauth_kakao")
	public String oauthKakao(HttpServletRequest request, String code) throws Exception {

		HttpSession session = request.getSession();

		KakaoController kakao = new KakaoController();

		String access_token = kakao.getAccessToken(code);

		Map<String, Object> userInfo = kakao.getUserInfo(access_token);
		Map<String, String> properties = (Map<String, String>) userInfo.get("properties"); //
		Map<String, Object> kakao_account = (Map<String, Object>) userInfo.get("kakao_account"); //

		String kakao_id = Integer.toString((int) userInfo.get("id"));

		String email = (String) kakao_account.get("email");
		session.setAttribute("kakaoLoginUser", kakao_id);
		session.setAttribute("loginUser", kakao_id);

		return "redirect:/home.do";
	}

	// get 오픈뱅킹 인증 url
	@RequestMapping(value = "/getAuthorize")
	public @ResponseBody String openBanking() {

		OpenBanking bank = new OpenBanking();
		String reqUrl = bank.getAuthorize();

		return reqUrl;
	}

	// 오픈 뱅킹 3-leggedget code
	@RequestMapping(value = "/getOpenBankingToken")
	public String getOpenBankingToken(String code, String access_token) throws Exception {

		OpenBanking bank = new OpenBanking();
		bank.getToken(code);

		return "forward:/register";
	}

	// 오픈 뱅킹 2 legged get code
	@RequestMapping(value = "/getToken")
	public @ResponseBody String getToken(@RequestBody Map<String, String> map) throws Exception {

		String account = map.get("account");
		String birth = map.get("birth");

		OpenBanking bank = new OpenBanking();
		String access_token = bank.leggedToken();

		bank.getAccountInfo(map, access_token);

		return "register";
	}

	@RequestMapping("/kakaoRegister")
	public String kakaoRegister() {
		return "el/kakaoRegister";
	}

	@RequestMapping("/chkID")
	public @ResponseBody String chkID(@RequestParam String id) {

		int state = memberService.CheckID(id);

		if (state == 1) {
			return "ok";
		} else {
			return "id exists";
		}
	}

	@RequestMapping("/processJoin")
	public String processJoin(LoginDTO vo) { // vo 이름 변경

		vo.setAccount_holder(vo.getName());
		memberService.insertMember(vo);

		return "redirect:/";
	}

	@RequestMapping(value = "/findIDAuth", method = RequestMethod.POST)
	public @ResponseBody Map<String, String> emailAuth(Model model, @RequestBody Map<String, String> map)
			throws IOException, MessagingException {

		String res = memberService.findID(map.get("name"), map.get("email"));

		Map<String, String> resJson = new HashMap<String, String>();

		if (res != null) {
			resJson.put("res", "ok");

			final int CODE = mailSend.sendFindIDCode(map.get("email"));

			resJson.put("code", Integer.toString(CODE));
			resJson.put("findID", res);
			resJson.put("email", map.get("email"));
		} else {
			resJson.put("res", "fail");
		}
		return resJson;
	}

	@RequestMapping(value = "/findPWAuth", method = RequestMethod.POST)
	public @ResponseBody Map<String, String> findPWAuth(HttpServletRequest request, HttpServletResponse response,
			@RequestBody Map<String, String> map) throws IOException, MessagingException {

		LoginDTO vo = memberService.findPW(map.get("id"), map.get("email")); // vo 이름 변경

		Map<String, String> resJson = new HashMap<String, String>();
		if (vo != null) {
			resJson.put("res", "ok");

			final int CODE = mailSend.sendFindPWCode(map.get("email"));
			resJson.put("code", Integer.toString(CODE));
			resJson.put("email", map.get("email"));
			resJson.put("id", vo.getId());
		} else {
			resJson.put("res", "fail");
		}
		return resJson;
	}

	@RequestMapping(value = "/sendUserPW", method = RequestMethod.POST)
	public @ResponseBody String sendUserPW(@RequestParam("email") String email, @RequestParam("id") String id)
			throws UnsupportedEncodingException, MessagingException {

		final String tempPW = new Tempkey().getKey(8, false);

		int res = memberService.alterTempPW(id, tempPW);
		if (res == 1) {
			mailSend.sendUserPW(email, tempPW);
			return "ok";
		}
		return "fail";
	}

	@RequestMapping(value = "/sendUserID", method = RequestMethod.POST)
	public @ResponseBody String sendUserID(@RequestParam("email") String email, @RequestParam("id") String id)
			throws UnsupportedEncodingException, MessagingException {

		mailSend.sendUserID(email, id);

		return "";
	}

	// MJ Email chk
	@RequestMapping("/chkEmail")
	public @ResponseBody String chkEmail(@RequestParam String email) {

		int state = memberService.CheckEmail(email);
		if (state == 1) {
			return "ok";
		} else {
			return "email exists";
		}
	}
	
	//alarm list
   //알람리스트
   @RequestMapping(value = "/getAlarm", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
   @ResponseBody
   public List<AlarmDTO> getAlarm(HttpServletRequest request) {
      HttpSession session = request.getSession();
      String id = (String) session.getAttribute("loginUser");

      List<AlarmDTO> list = alarmService.getAlarm(id);
      return list;
   }

}