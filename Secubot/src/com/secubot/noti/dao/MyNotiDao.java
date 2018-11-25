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
	
	public List<MyNotification> getMyNotiList(Connection conn, String myId) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement("select * from mynoti inner join member "
					+ "on mynoti.another_member_id = members.member_id "
					+ "where my_id=? and another_member_id not in (?) "
					+ "order by noti_no desc");
			pstmt.setString(1, myId);
			pstmt.setString(2, myId);
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
	
	public int selectById(Connection conn, int no) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement("select noti_no from mynoti where noti_no=?");
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			int notiNo = 0;
			if (rs.next()) {
				notiNo = rs.getInt("noti_no");
			}
			
			return notiNo;
			
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
	}
	
	public int update(Connection conn, int no) throws SQLException {
		try (PreparedStatement pstmt = conn.prepareStatement("update mynoti set read_check=true "
				+ "where noti_no=?")) {
			pstmt.setInt(1, no);
			return pstmt.executeUpdate();
		}
	}
	
	public int delete(Connection conn, int no) throws SQLException {
		try (PreparedStatement pstmt = conn.prepareStatement(""
				+ "delete from mynoti where noti_no=?")) {
			pstmt.setInt(1, no);
			return pstmt.executeUpdate();
		}
	}
	
	public int selectFalseCount(Connection conn, String myId) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement("select count(*) from mynoti "
					+ "where my_id=? and read_check=false another_memberid not in (?)");
			pstmt.setString(1, myId);
			pstmt.setString(2, myId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1);
			}
			return 0;
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
	}
}
