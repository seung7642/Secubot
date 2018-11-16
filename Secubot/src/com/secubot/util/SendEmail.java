package com.secubot.util;

import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.secubot.member.service.MailInfo;

public class SendEmail {

	public static void send(MailInfo mailInfo) {
		String admin = "user";
		String password = "password";
		
		Properties props = System.getProperties();
		props.put("mail.smtp.user", admin);
		props.put("mail.smtp.host", "smtp.naver.com");
		props.put("mail.smtp.port", "587");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.trust", "smtp.naver.com");
		
		Authenticator auth = new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(admin+"@naver.com", password);
			}
		};
		
		Session mailSession = Session.getDefaultInstance(props, auth);
		Message msg = new MimeMessage(mailSession);
		
		try {
			InternetAddress to = new InternetAddress(mailInfo.getEmail()); 
			msg.setFrom(new InternetAddress(admin+"@naver.com")); 
			msg.setRecipient(Message.RecipientType.TO, to); 
			msg.setSubject("SIEM Project"); 
			msg.setSentDate(new Date()); 
			msg.setContent(mailInfo.getContent(), "text/html;charset=euc-kr"); 
			Transport.send(msg);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
}