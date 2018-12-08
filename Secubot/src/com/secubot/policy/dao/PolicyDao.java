package com.secubot.policy.dao;

import java.util.ArrayList;
import java.util.List;

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
			pstmt = conn.prepareStatement("insert into policy_process (policy_name, process_name) values(?, ?)");
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
	
	public List<AgentPolicy> listAgentPolicy(Connection conn) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement("select * from policy_process");
			rs = pstmt.executeQuery();
			List<AgentPolicy> agentList = new ArrayList<>();
			while (rs.next()) {
				agentList.add(new AgentPolicy(
						rs.getString("policy_name"),
						rs.getString("process_name")
						));
			}
			return agentList;
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
	}
	
	public int CountAgentPolicy(Connection conn) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement("select count(*) from policy_process");
			rs = pstmt.executeUpdate();
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
