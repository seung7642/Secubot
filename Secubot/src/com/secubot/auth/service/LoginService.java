package com.secubot.auth.service;

import java.sql.Connection;
import java.sql.SQLException;

import com.secubot.auth.model.User;
import com.secubot.jdbc.connection.ConnectionProvider;
import com.secubot.jdbc.JdbcUtil;
import com.secubot.member.dao.MemberDao;
import com.secubot.member.model.Member;

public class LoginService {

	MemberDao memberDao = new MemberDao();
	
	public User login(String id, String password) {
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			Member member = memberDao.selectById(conn, id);
			
			if (member == null) {
				throw new LoginFailException();
			}
			
			if (member.getPassword() == null) {
				throw new PasswordNotFoundException();
			}
			
			if (!member.matchPassword(password)) {
				throw new LoginFailException();
			}
			
			boolean passwordCheck = member.getPassword() == null ? false : true;
			
			conn.commit();
			return new User(
					member.getId(),
					member.getName(),
					member.getEmail(),
					member.isRegisterCheck(),
					passwordCheck);
		} catch (SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException();
		} finally {
			JdbcUtil.close(conn);
		}
	}
}
