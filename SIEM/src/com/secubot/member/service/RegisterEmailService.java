package com.secubot.member.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.management.RuntimeErrorException;

import com.secubot.auth.model.User;
import com.secubot.jdbc.connection.ConnectionProvider;
import com.secubot.jdbc.JdbcUtil;
import com.secubot.member.dao.MemberDao;
import com.secubot.member.model.Member;

public class RegisterEmailService {
	
	MemberDao memberDao = new MemberDao();
	
	public User register(String email, String registerCode) {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			Member member = memberDao.selectByEmail(conn, email);
			
			if (member == null) {
				throw new MemberNotFoundException();
			}
			
			if (!member.matchRegisterCheck(registerCode)) {
				throw new RegisterCodeNotMatchException();
			}
			
			member.setRegisterCheck(true);
			memberDao.updateRegisterCheck(conn, member);
			conn.commit();
			boolean passwordCheck = member.getPassword() == null ? false : true;
			
			return new User(
					member.getId(),
					member.getName(),
					member.getEmail(),
					member.isRegisterCheck(),
					passwordCheck
					);
		} catch (SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(conn);
		}
	}
}
