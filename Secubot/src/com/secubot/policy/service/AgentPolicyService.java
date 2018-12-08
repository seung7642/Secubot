package com.secubot.policy.service;

import java.sql.Connection;
import java.sql.SQLException;

import com.secubot.policy.model.AgentPolicy;
import com.secubot.policy.dao.PolicyDao;
import com.secubot.jdbc.connection.ConnectionProvider;

public class AgentPolicyService {

	private AgentPolicy agentPolicy = null;
	private AgentPolicyPage agentPage = null;
	private PolicyDao policyDao = new PolicyDao();
	
	public void addAgentPolicy(String policy_name, String process_name) throws SQLException {
		try (Connection conn = ConnectionProvider.getConnection()) {
			agentPolicy = new AgentPolicy(policy_name, process_name);
			policyDao.insert(conn, agentPolicy);
		}
	}
	
	public AgentPolicyPage listAgentPolicy() throws SQLException {
		
	}
}
