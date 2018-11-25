package com.secubot.noti.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Date;

import com.secubot.jdbc.JdbcUtil;
import com.secubot.noti.model.MyNotification;

public class MyNotiDao {

	public void insert(Connection conn, MyNotification myNoti) throws SQLException {
		try (PreparedStatement pstmt = conn.prepareStatement("insert into mynoti "
				+ "(article_no, another_member_id, noti_type, read_check, regdate, my_id) "
				+ "values(?, ?, ?, ?, ?, ?)")) {
			pstmt.setInt(1, myNoti.getArticleNo());
			pstmt.setInt(2, myNoti.getAnotherMemberId());
			pstmt.setString(3, myNoti.getType());
			pstmt.setBoolean(4, myNoti.isReadCheck());
			pstmt.setTimestamp(5, new Timestamp(myNoti.getRegdate().getTime()));
			pstmt.setInt(6, myNoti.getMyId());
			pstmt.executeUpdate();
		}
	}
	
	public List<MyNotification> getMyNotiList(Connection conn, int myId) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement("select * from mynoti inner join member "
					+ "on mynoti.another_member_id = members.member_id "
					+ "where my_id=? and another_member_id not in (?) "
					+ "order by noti_no desc");
			pstmt.setInt(1, myId);
			pstmt.setInt(2, myId);
			rs = pstmt.executeQuery();
			List<MyNotification> notiList = new ArrayList<>();
			while (rs.next()) {
				notiList.add(convertNoti(rs));
			}
			
			return notiList;
			
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
	}
	
	private MyNotification convertNoti(ResultSet rs) throws SQLException {
		return new MyNotification(rs.getInt("noti_no"),
				rs.getInt("article_no"), rs.getInt("another_member_id"), rs.getString("noti_type"),
				rs.getBoolean("read_check"), toDate(rs.getTimestamp("regdate")), rs.getInt("my_id"));
	}
	
	private Date toDate(Timestamp ts) {
		return new Date(ts.getTime());
	}
}
