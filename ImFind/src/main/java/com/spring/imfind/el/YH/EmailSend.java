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
		
		Random r = new Random(); // ��������
		int num = r.nextInt(999999);
		
		String setfrom = "3bnm1128@naver.com";
		String tomail = email;
		
		String title = "ImFind ������ȣ �Դϴ�.";
		String content = System.getProperty("line.separator") + "���̵� ã�⸦ ���� ������ȣ �Դϴ�. " + 
						System.getProperty("line.separator") + "������ȣ [ " + num + " ]" + 
						System.getProperty("line.separator") + "����Ʈ�� ���ư� ������ȣ�� �Է����ּ���";
			
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
