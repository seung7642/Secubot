package com.secubot.policy.service;

import java.util.ArrayList;
import java.util.List;
import java.sql.Connection;
import java.sql.SQLException;

import com.secubot.policy.model.ProcessPolicyDetail;
import com.secubot.policy.dao.PolicyDao;
import com.secubot.auth.service.User;
import com.secubot.jdbc.connection.ConnectionProvider;

public class AgentPolicyService {

	private ProcessPolicyDetail ProcessPolicyDetail = null;
	private PolicyDao policyDao = new PolicyDao();
	
	public void addProcessPolicyDetail(User user, String policy_description, String process_name, String rule_json) throws SQLException {
		try (Connection conn = ConnectionProvider.getConnection()) {
			ProcessPolicyDetail = new ProcessPolicyDetail(user.getName(), policy_description, true, true, rule_json, process_name);
			policyDao.insertProcessPolicyDetail(conn, ProcessPolicyDetail);
		}
	}
	
	public AgentPolicyPage getAgentPage() throws SQLException {
		try (Connection conn = ConnectionProvider.getConnection()) {
			int total = 0;
			List<ProcessPolicyDetail> list = new ArrayList<>();
			total = policyDao.countProcessPolicyDetail(conn);
			list = policyDao.listProcessPolicyDetail(conn);
			AgentPolicyPage agentPage = new AgentPolicyPage(total, list);
			
			return agentPage;
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
