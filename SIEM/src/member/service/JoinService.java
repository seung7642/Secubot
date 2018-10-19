package member.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;
import member.dao.MemberDao;
import member.model.Member;
import util.SendEmail;

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
							false // 이메일 인증 체크 기본:false
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
	
	public void sendEmail(String email, String registerCode) { // 이메일 전송 메서드
		Connection conn = null;
		Member member = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			
			if (registerCode == null) { // 이메일 재전송 시 기존 발급했던 인증 코드 DB에서 가져옴
				member = memberDao.selectByEmail(conn, email);
				registerCode = member.getRegisterCode();
			}
			
			MailInfo mailInfo = new MailInfo(email, registerCode); // 메일 정보
			mailInfo.setRegisterContent(); // 메일 설정(인증)
			SendEmail.send(mailInfo); // 이메일 전송 관련 static 메서드
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


