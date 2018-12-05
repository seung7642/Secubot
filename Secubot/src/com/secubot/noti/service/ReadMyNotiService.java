package com.secubot.noti.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.secubot.noti.dao.MyNotiDao;
import com.secubot.noti.model.MyNotification;
import com.secubot.jdbc.connection.ConnectionProvider;

public class ReadMyNotiService {

	private MyNotiDao notiDao = new MyNotiDao();
	
	public NotiData readMyNoti(String myId) {
		try (Connection conn = ConnectionProvider.getConnection()) {
			List<MyNotification> notiList = notiDao.getMyNotiList(conn, myId);
			return new NotiData(notiList);
		} catch (SQLException e) {
			throw new RuntimeException();
		}
	}
	
	public Boolean isNotiCheck(String myId) {
		try (Connection conn = ConnectionProvider.getConnection()) {
//			int falseCnt = notiDao.selectFalseCount(conn, myId);
//			if (falseCnt == 0) {
//				return true;
//			}
			return false;
		} catch (SQLException e) {
			throw new RuntimeException();
		}
	}
}
