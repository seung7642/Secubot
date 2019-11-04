package com.secubot.noti.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Date;

import com.secubot.article.model.Writer;
import com.secubot.jdbc.JdbcUtil;
import com.secubot.noti.model.MyNotification;

public class MyNotiDao {

	public void insert(Connection conn, MyNotification myNoti) throws SQLException {
		try (PreparedStatement pstmt = conn.prepareStatement("insert into mynoti "
				+ "(article_no, writer_id, writer_name, read_check, regdate)"
				+ "values(?, ?, ?, ?, ?)")) {
			pstmt.setInt(1, myNoti.getArticleNo());
			pstmt.setString(2, myNoti.getWriter().getId());
			pstmt.setString(3, myNoti.getWriter().getName());
			pstmt.setBoolean(4, myNoti.isReadCheck());
			pstmt.setTimestamp(5, new Timestamp(myNoti.getRegdate().getTime()));
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
		return new MyNotification(
				rs.getInt("article_no"),
				new Writer(rs.getString("writer_id"), rs.getString("writer_name"), rs.getString("writer_email")),
				rs.getBoolean("read_check"), 
				toDate(rs.getTimestamp("regdate")));
	}
	
	private Date toDate(Timestamp ts) {
		return new Date(ts.getTime());
	}
	
	public int selectByNotiNo(Connection conn, int noti_no) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement("select noti_no from mynoti where noti_no=?");
			pstmt.setInt(1, noti_no);
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
				+ "where article_no=?")) {
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
	
	public int notiCount(Connection conn) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		// mynoti 테이블에 있는 레코드 값들 중 read_check=0 인 레코드들의 갯수를 반환한다.
		try {
			pstmt = conn.prepareStatement("select count(*) from mynoti "
				+ "where read_check=0");
			rs = pstmt.executeQuery();
			int notiCount = 0;
			if (rs.next()) {
				notiCount = rs.getInt(1);
			}
			return notiCount;
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
	}
}
