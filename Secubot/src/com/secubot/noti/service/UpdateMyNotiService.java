package com.secubot.noti.service;

import java.sql.Connection;
import java.sql.SQLException;

import com.secubot.noti.dao.MyNotiDao;
import com.secubot.jdbc.connection.ConnectionProvider;

public class UpdateMyNotiService {

	private MyNotiDao notiDao = new MyNotiDao();
	
	public void update(int notiNo) {
		try (Connection conn = ConnectionProvider.getConnection()) {
			
			int noti = notiDao.selectById(conn, notiNo);
			
			if (noti <= 0) {
				throw new NotificationNotFoundException();
			}
			
			notiDao.update(conn, noti);
			
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
