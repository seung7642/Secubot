package com.secubot.policy.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.secubot.policy.model.AgentPolicy;
import com.secubot.jdbc.JdbcUtil;

public class PolicyDao {

	public void insert(Connection conn, AgentPolicy agentPolicy) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement("insert into policy_process values (?, ?)");
			pstmt.setString(1, agentPolicy.getPolicyName());
			pstmt.setString(2, agentPolicy.getProcessName());
			pstmt.executeUpdate();
		} catch(SQLException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
	}
}
