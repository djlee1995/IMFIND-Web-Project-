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
        sendMail.setSubject("[ Imfind 아이디 찾기 인증코드]");
        sendMail.setText(new StringBuffer().append("<h3>���̵� ã�� ���� ��ȣ</h3>")
                .append("���̵� ã�⸦ ���� ������ȣ �Դϴ�.<br>")
                .append("������ȣ [ <b>" + code + "<b> ] <br>")
                .append("�����ڵ带 �Է����ּ���.")
                .toString());
        sendMail.setFrom("szexdr@naver.com", "ImFind");
        sendMail.setTo(email);
        sendMail.send();
        
        return code;
    }
	
	public int sendFindPWCode(String email) throws MessagingException, UnsupportedEncodingException {
		
		int code = new Tempkey().getNumCode();
        MailHandler sendMail = new MailHandler(mailSender);
        sendMail.setSubject("[ Imfind �̸��� ����]");
        sendMail.setText(new StringBuffer().append("<h3>��й�ȣ ã�� ���� ��ȣ</h3>")
                .append("��й�ȣ ã�⸦ ���� ������ȣ �Դϴ�.<br>")
                .append("������ȣ [ <b>" + code + "<b> ] <br>")
                .append("�����ڵ带 �Է����ּ���.")
                .toString());
        sendMail.setFrom("szexdr@naver.com", "ImFind");
        sendMail.setTo(email);
        sendMail.send();
        
        return code;
	}
	
	public void sendUserID(String email, String id) throws MessagingException, UnsupportedEncodingException {
		
	    MailHandler sendMail = new MailHandler(mailSender);
 
        sendMail.setSubject("[ Imfind ���̵� ã�� ���]");
        sendMail.setText(new StringBuffer().append("<h3>ȸ������ ���̵�</h3>")
                .append("ȸ������ ���̵�� [ <b>" + id + "<b> ] �Դϴ�. <br>")
                .append("<a target='http://localhost:8080/imfind/login'>Imfind �α��� ȭ�� �̵� </a>")
                .toString());
        sendMail.setFrom("szexdr@naver.com", "ImFind");
        sendMail.setTo(email);
        sendMail.send();
	}
	
	public void sendUserPW(String email, String tempPW) throws MessagingException, UnsupportedEncodingException {
		
		MailHandler sendMail = new MailHandler(mailSender);

    	sendMail.setSubject("[ Imfind �ӽ� ��й�ȣ]");
    	sendMail.setText(new StringBuffer().append("<h3>�ӽ� ��й�ȣ �߱�</h3>")
    			.append("ȸ������ �ӽú�й�ȣ�� [ <b>" + tempPW + "<b> ] �Դϴ�. <br>")
    			.append("<a target='http://localhost:8080/imfind/login'>Imfind �α��� ȭ�� �̵� </a>")
    			.toString());
    	sendMail.setFrom("szexdr@naver.com", "ImFind");
    	sendMail.setTo(email);
    	sendMail.send();
	}
}
