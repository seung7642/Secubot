package com.secubot.noti.service;

import java.sql.Connection;
import java.sql.SQLException;

import com.secubot.noti.dao.MyNotiDao;
import com.secubot.jdbc.connection.ConnectionProvider;

public class CheckMyNotiService {

	private MyNotiDao notiDao = new MyNotiDao();
	
	public int check() {
		try (Connection conn = ConnectionProvider.getConnection()) {
			int notiCount = notiDao.notiCount(conn);
			return notiCount;
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
