package com.secubot.policy.service;

import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import java.sql.Connection;
import java.sql.SQLException;

import com.secubot.policy.model.LoginSession;
import com.secubot.policy.model.ProcessPolicy;
import com.secubot.policy.model.ProcessPolicyDetail;
import com.secubot.policy.dao.PolicyDao;
import com.secubot.auth.service.User;
import com.secubot.jdbc.connection.ConnectionProvider;

public class AgentPolicyService {

	private ProcessPolicyDetail processPolicyDetail = null;
	private PolicyDao policyDao = new PolicyDao();
	
	public void addProcessPolicyDetail(User user, String policy_description, String process_name, String rule_json, String agent_hash) throws SQLException, ParseException {
		try (Connection conn = ConnectionProvider.getConnection()) {
			conn.setAutoCommit(false);
			processPolicyDetail = new ProcessPolicyDetail(user.getName(), policy_description, true, true, rule_json, process_name);
			String jsonStr = "{ \"MD5\" : \"" +  processPolicyDetail.getRule_json() + "\" }";
			JSONParser parser = new JSONParser();
			Object obj = parser.parse(jsonStr);
			JSONObject jsonObj = (JSONObject) obj;
			
			int process_policy_id = policyDao.insertProcessPolicyDetail(conn, processPolicyDetail, jsonStr);
			if (process_policy_id == 0) {
				throw new RuntimeException();
			}
			
			policyDao.insertProcessPolicy(conn, new ProcessPolicy(process_policy_id, agent_hash));
			
			conn.commit();
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
	
	public List<LoginSession> getList() throws SQLException {
		try (Connection conn = ConnectionProvider.getConnection()) {
			return policyDao.selectLoginSession(conn);
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
