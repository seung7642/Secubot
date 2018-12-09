package com.secubot.policy.dao;

import java.util.ArrayList;
import java.util.List;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.secubot.policy.model.AgentPolicy;
import com.secubot.policy.model.NetworkPolicy;
import com.secubot.jdbc.JdbcUtil;

public class PolicyDao {

	/*
	 * 1. Agent Policy
	 */
	public void insertAgent(Connection conn, AgentPolicy agentPolicy) throws SQLException {
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
	
	public int countAgentPolicy(Connection conn) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement("select count(*) from policy_process");
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
	
	/*
	 * 2. Network Policy
	 */
	public void insertNetwork(Connection conn, NetworkPolicy networkPolicy) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement("insert into policy_network "
					+ "(policy_name, src_ip, dst_ip, port) "
					+ "values (?, ?, ?, ?)");
			pstmt.setString(1, networkPolicy.getPolicyName());
			pstmt.setString(2, networkPolicy.getSrcIP());
			pstmt.setString(3, networkPolicy.getDstIP());
			pstmt.setString(4, networkPolicy.getPort());
			pstmt.executeUpdate();
		} catch(SQLException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
	}
	
	public List<NetworkPolicy> listNetworkPolicy(Connection conn) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement("select * from policy_network");
			rs = pstmt.executeQuery();
			List<NetworkPolicy> list = new ArrayList<>();
			while (rs.next()) {
				list.add(new NetworkPolicy(
						rs.getString("policy_name"),
						rs.getString("src_ip"),
						rs.getString("dst_ip"),
						rs.getString("port")
						));
			}
			return list;
		} catch(SQLException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
	}
	
	public int countNetworkPolicy(Connection conn) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement("select count(*) from policy_network");
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1);
			}
			return 0;
		} catch(SQLException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
	}
}
