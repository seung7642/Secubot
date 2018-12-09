package com.secubot.policy.service;

import java.sql.Connection;

import com.secubot.policy.dao.PolicyDao;
import com.secubot.policy.model.NetworkPolicy;
import com.secubot.jdbc.connection.ConnectionProvider;

public class NetworkPolicyService {

	private PolicyDao policyDao = new PolicyDao();
	
	public NetworkPolicyPage addPolicy(String policy_name, String src_ip, String dst_ip, String port) {
		try (Connection conn = ConnectionProvider.getConnection()) {
			NetworkPolicy networkPolicy = new NetworkPolicy(policy_name, src_ip, dst_ip, port);
			policyDao.insertNetwork(conn, networkPolicy);
		}	
	}
}
