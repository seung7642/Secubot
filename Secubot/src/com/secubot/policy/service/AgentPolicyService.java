package com.secubot.policy.service;

import java.util.ArrayList;
import java.util.List;
import java.sql.Connection;
import java.sql.SQLException;

import com.secubot.policy.model.AgentPolicy;
import com.secubot.policy.dao.PolicyDao;
import com.secubot.jdbc.connection.ConnectionProvider;

public class AgentPolicyService {

	private AgentPolicy agentPolicy = null;
	private PolicyDao policyDao = new PolicyDao();
	
	public void addAgentPolicy(String policy_name, String process_name) throws SQLException {
		try (Connection conn = ConnectionProvider.getConnection()) {
			agentPolicy = new AgentPolicy(policy_name, process_name);
			policyDao.insertAgent(conn, agentPolicy);
		}
	}
	
	public AgentPolicyPage getAgentPage() throws SQLException {
		try (Connection conn = ConnectionProvider.getConnection()) {
			int total = 0;
			List<AgentPolicy> list = new ArrayList<>();
			total = policyDao.countAgentPolicy(conn);
			list = policyDao.listAgentPolicy(conn);
			AgentPolicyPage agentPage = new AgentPolicyPage(total, list);
			
			return agentPage;
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
