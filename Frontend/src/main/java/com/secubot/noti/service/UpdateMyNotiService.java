package com.secubot.noti.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;

import com.secubot.noti.model.MyNotification;
import com.secubot.article.service.WriteRequest;
import com.secubot.noti.dao.MyNotiDao;
import com.secubot.jdbc.connection.ConnectionProvider;

public class UpdateMyNotiService {

	private MyNotiDao notiDao = new MyNotiDao();
	
	public void update(int article_no) {
		// Method for update read_check
		try (Connection conn = ConnectionProvider.getConnection()) {
			notiDao.update(conn, article_no);
			
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public void insert(int articleNo, WriteRequest writeReq) {
		try (Connection conn = ConnectionProvider.getConnection()) {
			MyNotification myNoti = convert(articleNo, writeReq);
			notiDao.insert(conn, myNoti);
			
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public MyNotification convert(int articleNo, WriteRequest writeReq) {
		/*return new MyNotification(
				articleNo, 
				writeReq.getWriter().getId(),
				writeReq.getWriter().getName(),
				false,
				new Date());*/
		return new MyNotification(
				articleNo,
				writeReq.getWriter(),
				false,
				new Date());
	}
}
