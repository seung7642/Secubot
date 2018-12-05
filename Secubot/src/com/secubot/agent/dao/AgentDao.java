package com.secubot.agent.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.secubot.agent.model.LoginSession;
import com.secubot.jdbc.JdbcUtil;

public class AgentDao {

	public List<LoginSession> select(Connection conn) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		// TODO: 로직 재검사
		try {
			pstmt = conn.prepareStatement("select * from login_session");
			rs = pstmt.executeQuery();
			List<LoginSession> result = new ArrayList<>();
			while (rs.next()) {
				result.add(new LoginSession(
						rs.getString("user_name"),
						rs.getString("user_phone"),
						rs.getString("user_ip"),
						rs.getString("user_mac"),
						rs.getString("agent_hash"),
						rs.getString("api_token"),
						rs.getString("hddid")
						));
			}
			return result;
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
	}
	
	public int selectCount(Connection conn) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement("select count(*) from login_session");
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
