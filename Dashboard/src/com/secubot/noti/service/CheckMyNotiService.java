package com.secubot.noti.service;

import java.sql.Connection;
import java.sql.SQLException;

import com.secubot.noti.dao.MyNotiDao;
import com.secubot.jdbc.connection.ConnectionProvider;

public class CheckMyNotiService {

	private MyNotiDao notiDao = new MyNotiDao();
	
	public int check() {
		// TODO: mynoti 테이블에 있는 레코드들 중 read_check 값이 false인 것의 갯수를 체크한다.
		try (Connection conn = ConnectionProvider.getConnection()) {
			int notiCount = notiDao.notiCount(conn);
			return notiCount;
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
