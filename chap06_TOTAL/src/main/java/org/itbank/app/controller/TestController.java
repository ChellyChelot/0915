package org.itbank.app.controller;

import java.util.UUID;

import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/test")
public class TestController {
	@Autowired
	JavaMailSender sender;	// 
	@RequestMapping("/basic")
	public String basicHandle() {
		return "test/basic";
	}
	@RequestMapping("/uuid")
	public void uuidHandle( ) {
		UUID u = UUID.randomUUID();	// ���� �ĺ��ڰ� �ʿ��ϰ� �ɶ� ���Ǵ� Ŭ����
		// ������ ��Ģ�� ���� ���� �Ϻ��ϰ� �ߺ����� �ʴ� ���� Ű�� �����ؼ� ����Ҽ� ����
		// 32���� 16����..
		System.out.println(Math.pow(16, 8));
		System.out.println(u.toString());
		String auth_str = u.toString().substring(0,13);
		System.out.println(auth_str);	
	}
	@RequestMapping("/send01")
	public void send01Handle(@RequestParam(name="t") String t) {
		// 1. SimpleMailMessage ��ü �̿�
		SimpleMailMessage msg = new SimpleMailMessage();
		// �߽���, ������, ����
		try {
			msg.setTo(t);	// ������� �ּ�.
		//	msg.setFrom("master@itbank.com");	// ������ ��� �ּ�.
					// smtp.gmail ���� ��ȸ�ؼ� ���۵ɶ�, ������ ��� �ּҰ�, gmail �ּҷ� �ڵ� ��ȯ ,
			msg.setSubject("ȯ������");
			String text = "ȯ���մϴ�.\n�׻� �ּ��� ���񽺸� �����ϰڽ��ϴ�.";
			text += "<h2>text</h2>";	// TEXT �� ���� ����
			msg.setText(text);
			sender.send(msg);	// �߼�
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/send02")
	public void send02Handle(@RequestParam(name="t") String t) {
		// MimeMessage 
		try {
			MimeMessage msg = sender.createMimeMessage(); 
			// TO
			msg.setRecipient(RecipientType.TO, new InternetAddress(t));
			// SUBJECT
			msg.setSubject("WELCOME");
			// TEXT
			String text = "<h1>ȯ���մϴ�</h1>";
			text += "������ ȯ���մϴ�.";
			text += "<a href=\"http://192.168.10.61\">����Ʈ �̵�</a>";
			msg.setText(text, "UTF-8", "html");
			// FROM
			sender.send(msg);
		}catch(Exception e ) {
			e.printStackTrace();
		}
	}
}










