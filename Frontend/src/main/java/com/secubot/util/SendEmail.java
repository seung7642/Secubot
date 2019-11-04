package com.secubot.util;

import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import com.secubot.article.model.ArticleContent;
import com.secubot.article.service.ArticleData;
import com.secubot.auth.service.User;
import com.secubot.member.service.MailInfo;

public class SendEmail {

	public static void send(User user, ArticleData articleData) {
		
		// 송신자 이메일 아이디와 패스워드
		String admin = "atmdgh1234";
		String password = "secubot1234";
		
		// Properties에 메일 설정내용 저장
		Properties props = System.getProperties();
		props.put("mail.smtp.user", admin);
		props.put("mail.smtp.auth", true);
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.naver.com");
		props.put("mail.smtp.port", "587");
		props.put("mail.smtp.ssl.trust", "smtp.naver.com");
		
		Authenticator auth = new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(admin+"@naver.com", password);
			}
		};
		
		Session mailSession = Session.getDefaultInstance(props, auth);
		Message msg = new MimeMessage(mailSession);
		
		try {
//			InternetAddress to = new InternetAddress(mailInfo.getEmail()); 
			msg.setFrom(new InternetAddress(admin+"@naver.com"));
			msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(articleData.getArticle().getWriter().getEmail())); 
			msg.setSubject("민원신청에 따른 결과입니다."); 
			msg.setSentDate(new Date());
			
			String contentMsg = "<strong>안녕하세요. Secubot 팀입니다.</strong><br/><br/>"
					+ "<strong>접수하신 내용입니다.</strong><br/>"
					+ "==============================================<br/>"
					+ "<strong>src_ip:</strong> " + articleData.getContent().getSrc_ip() + "<br/>"
					+ "<strong>dst_ip:</strong> " + articleData.getContent().getDst_ip() + "<br/>"
					+ "<strong>dst_port:</strong> " + articleData.getContent().getDst_port() + "<br/>"
					+ "==============================================<br/>"
					+ "<strong>접수하신 내용이 정상적으로 처리되었습니다.</strong><br/>"
					+ "<strong>감사합니다.</strong>";
			MimeBodyPart mimeBodyPart = new MimeBodyPart();
			mimeBodyPart.setContent(contentMsg, "text/html;charset=utf-8");
			
			Multipart multipart = new MimeMultipart();
			multipart.addBodyPart(mimeBodyPart);
			
			msg.setContent(multipart);
//			msg.setHeader("content-type", "text/html; charset=utf-8");
			
			Transport.send(msg);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
}