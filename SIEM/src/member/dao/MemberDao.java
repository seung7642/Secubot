package member.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import jdbc.JdbcUtil;
import member.model.Member;

public class MemberDao {

	public void insert(Connection conn, Member member) throws SQLException {
		try (PreparedStatement pstmt = conn.prepareStatement(
				"insert into member values(?,?,?,?,?,?,?)")) {
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getEmail());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getPassword());
			pstmt.setTimestamp(5, new Timestamp(member.getRegDate().getTime()));
			pstmt.setString(6, member.getRegisterCode());
			pstmt.setBoolean(7, member.isRegisterCheck());
			pstmt.executeUpdate();
		}
	}
	
	public Member selectByEmail(Connection conn, String email) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(
					"select * from member where email=?");
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			Member member = null;
			if (rs.next()) {
				member = toMember(rs);
			}
			return member;
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
	}
	
	public Member selectById(Connection conn, String id) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement("select * from member where id=?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			Member member = null;
			if (rs.next()) {
				member = toMember(rs);
			}
			return member;
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
	}
	
	public int select(Connection conn) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(
					"select count(*) as total from siem.member"); // TODO: 회원정보의 갯수를 조회하는 쿼리문 넣기
			int countNum = 0;
			rs = pstmt.executeQuery();
			while (rs.next()) {
				countNum = rs.getInt("total");
			}
			
			return countNum;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}
	
	public void updateRegisterCheck(Connection conn, Member member) throws SQLException {
		try (PreparedStatement pstmt = conn.prepareStatement(
				"update members set registerCheck=?")) {
			pstmt.setBoolean(1, member.isRegisterCheck());
			pstmt.executeQuery();
		}
	}
	
	private Member toMember(ResultSet rs) throws SQLException {
		return new Member(
				rs.getString("id"),
				rs.getString("email"),
				rs.getString("name"),
				rs.getString("password"),
				toDate(rs.getTimestamp("regdate")),
				rs.getString("regcode"),
				rs.getBoolean("regcodeCheck")
				);
	}
	
	private Date toDate(Timestamp date) {
		return date == null ? null : new Date(date.getTime());
	}
}
