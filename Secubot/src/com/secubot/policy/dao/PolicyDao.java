package com.secubot.policy.dao;

import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONObject;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.secubot.policy.model.ProcessPolicyDetail;
import com.secubot.policy.model.NetworkPolicy;
import com.secubot.jdbc.JdbcUtil;

public class PolicyDao {

	/*
	 * 1. Agent Policy
	 */
	public void insertProcessPolicyDetail(Connection conn, ProcessPolicyDetail agentPolicy, JSONObject jsonObj) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement("insert into process_policy_detail "
					+ "(policy_author, policy_description, flag_accept, flag_apply, rule_json, image_name) "
					+ "values(?, ?, ?, ?, ?, ?)");
			pstmt.setString(1, agentPolicy.getPolicy_author());
			pstmt.setString(2, agentPolicy.getPolicy_description());
			pstmt.setBoolean(3, agentPolicy.isFlag_accept());
			pstmt.setBoolean(4, agentPolicy.isFlag_apply());
			pstmt.setObject(5, jsonObj);
			pstmt.setString(6, agentPolicy.getImage_name());
			pstmt.executeUpdate();
		} catch(SQLException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
	}
	
	public List<ProcessPolicyDetail> listProcessPolicyDetail(Connection conn) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement("select * from process_policy_detail");
			rs = pstmt.executeQuery();
			List<ProcessPolicyDetail> agentList = new ArrayList<>();
			while (rs.next()) {
				agentList.add(new ProcessPolicyDetail(
						rs.getInt("process_policy_id"),
						rs.getString("policy_author"),
						rs.getString("policy_description"),
						rs.getBoolean("flag_accept"),
						rs.getBoolean("flag_apply"),
						rs.getString("rule_json"),
						rs.getString("image_name")
						));
			}
			return agentList;
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
	}
	
	public int countProcessPolicyDetail(Connection conn) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement("select count(*) from process_policy_detail");
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
