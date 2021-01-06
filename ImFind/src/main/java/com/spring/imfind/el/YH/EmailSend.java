package com.spring.imfind.el.YH;

import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

public class EmailSend {
	
	@Autowired
	JavaMailSender mailSender;

	
	public int addressEmail(String email) {
		
		Random r = new Random(); // 난수생성
		int num = r.nextInt(999999);
		
		String setfrom = "3bnm1128@naver.com";
		String tomail = email;
		
		String title = "ImFind 인증번호 입니다.";
		String content = System.getProperty("line.separator") + "아이디 찾기를 위한 인증번호 입니다. " + 
						System.getProperty("line.separator") + "인증번호 [ " + num + " ]" + 
						System.getProperty("line.separator") + "사이트로 돌아가 인증번호를 입력해주세요";
			
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			
			messageHelper.setFrom(setfrom);
			messageHelper.setTo(tomail);
			messageHelper.setSubject(title);
			messageHelper.setText(content);
			mailSender.send(message);
			
		}
		catch(Exception e) {
			System.out.println("mainSending error");
			System.out.println(e);
		}
		return num;
	}
}
