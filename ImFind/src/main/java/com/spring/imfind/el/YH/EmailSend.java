package com.spring.imfind.el.YH;

import java.io.UnsupportedEncodingException;
import javax.mail.MessagingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;

@Component
public class EmailSend {

	@Autowired
	JavaMailSender mailSender;

	public int sendFindIDCode(String email) throws MessagingException, UnsupportedEncodingException {

		int code = new Tempkey().getNumCode();
		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("[ Imfind 이메일 인증]");
		sendMail.setText(new StringBuffer().append("<h3>아이디 찾기 인증 번호</h3>").append("아이디 찾기를 위한 인증번호 입니다.<br>")
				.append("인증번호 [ <b>" + code + "<b> ] <br>").append("인증코드를 입력해주세요.").toString());
		sendMail.setFrom("szexdr@naver.com", "ImFind");
		sendMail.setTo(email);
		sendMail.send();

		return code;
	}

	public int sendFindPWCode(String email) throws MessagingException, UnsupportedEncodingException {

		int code = new Tempkey().getNumCode();
		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("[ Imfind 이메일 인증]");
		sendMail.setText(new StringBuffer().append("<h3>비밀번호 찾기 인증 번호</h3>").append("비밀번호 찾기를 위한 인증번호 입니다.<br>")
				.append("인증번호 [ <b>" + code + "<b> ] <br>").append("인증코드를 입력해주세요.").toString());
		sendMail.setFrom("szexdr@naver.com", "ImFind");
		sendMail.setTo(email);
		sendMail.send();

		return code;
	}

	public void sendUserID(String email, String id) throws MessagingException, UnsupportedEncodingException {

		MailHandler sendMail = new MailHandler(mailSender);

		sendMail.setSubject("[ Imfind 아이디 찾기 결과]");
		sendMail.setText(new StringBuffer().append("<h3>회원님의 아이디</h3>")
				.append("회원님의 아이디는 [ <b>" + id + "<b> ] 입니다. <br>").toString());
		sendMail.setFrom("szexdr@naver.com", "ImFind");
		sendMail.setTo(email);
		sendMail.send();
	}

	public void sendUserPW(String email, String tempPW) throws MessagingException, UnsupportedEncodingException {

		MailHandler sendMail = new MailHandler(mailSender);

		sendMail.setSubject("[ Imfind 임시 비밀번호]");
		sendMail.setText(
				new StringBuffer().append("<h3>임시 비밀번호 발급</h3>").append("회원님의 임시비밀번호는 [ <b>" + tempPW + "<b> ] 입니다.")
						.append("<a target='http://localhost:8080/imfind/login'>Imfind 로그인 화면 이동 </a>").toString());
		sendMail.setFrom("szexdr@naver.com", "ImFind");
		sendMail.setTo(email);
		sendMail.send();
	}
}