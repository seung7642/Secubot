package com.secubot.policy.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.secubot.policy.dao.PolicyDao;
import com.secubot.policy.model.NetworkPolicy;
import com.secubot.jdbc.connection.ConnectionProvider;

public class NetworkPolicyService {

	private PolicyDao policyDao = new PolicyDao();
	
	public void addPolicy(String policy_name, String src_ip, String dst_ip, String port) throws SQLException {
		try (Connection conn = ConnectionProvider.getConnection()) {
			NetworkPolicy networkPolicy = new NetworkPolicy(policy_name, src_ip, dst_ip, port);
			policyDao.insertNetwork(conn, networkPolicy);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public List<NetworkPolicy> listPolicy() throws SQLException {
		try (Connection conn = ConnectionProvider.getConnection()) {
			return policyDao.listNetworkPolicy(conn);
		} catch (SQLException e) {
			throw new RuntimeException();
		}
	}
	
	public int countPolicy() throws SQLException {
		try (Connection conn = ConnectionProvider.getConnection()) {
			int total = policyDao.countNetworkPolicy(conn);
			return total;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
