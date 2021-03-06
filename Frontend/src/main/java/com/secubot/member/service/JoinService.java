package com.secubot.member.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.secubot.jdbc.JdbcUtil;
import com.secubot.jdbc.connection.ConnectionProvider;
import com.secubot.member.dao.MemberDao;
import com.secubot.member.model.Member;
import com.secubot.util.SendEmail;

public class JoinService {
	
	private MemberDao memberDao = new MemberDao();
	
	public void join(JoinRequest joinReq) {
		Connection conn = null;
		Member member = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			member = memberDao.selectById(conn, joinReq.getId());
			if (member != null) {
				JdbcUtil.rollback(conn);
				throw new DuplicateIdException();
			}
			
			if (!patternMatching(joinReq.getPassword())) {
				JdbcUtil.rollback(conn);
				throw new InvalidPasswordException();
			}
			
			memberDao.insert(conn,
					new Member(
							joinReq.getId(),
							joinReq.getEmail(),
							joinReq.getName(),
							joinReq.getPassword(),
							new Date(),
							joinReq.getRegisterCode(),
							false 
							));
			
			sendEmail(joinReq.getEmail(), joinReq.getRegisterCode());
			conn.commit();
		} catch (SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException();
		} finally {
			JdbcUtil.close(conn);
		}
	}
	
	public void sendEmail(String email, String registerCode) { 
		Connection conn = null;
		Member member = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			
			if (registerCode == null) { 
				member = memberDao.selectByEmail(conn, email);
				registerCode = member.getRegisterCode();
			}
			
			MailInfo mailInfo = new MailInfo(email, registerCode); 
			mailInfo.setRegisterContent();
//			SendEmail.send(mailInfo);
		} catch (SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException();
		} finally {
			JdbcUtil.close(conn);
		}
	}
	
	private boolean patternMatching(String password) {
		Pattern pattern = Pattern.compile("^.*(?=.{8,20})(?=.*[a-zA-Z])(?=.*[0-9]).*$");
		Matcher matcher = pattern.matcher(password);
		
		if(matcher.find()) {
			return true;
		} else {
			return false;
		}
	}
}
