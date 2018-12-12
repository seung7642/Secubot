package com.secubot.agent.service;

import java.sql.Connection;
import java.sql.SQLException;

import com.secubot.agent.model.AgentInfo;
import com.secubot.agent.dao.AgentInfoDao;
import com.secubot.jdbc.connection.ConnectionProvider;

public class InfoAgentService {

	private AgentInfoDao agentInfoDao = new AgentInfoDao();
	
	public AgentInfo getAgentInfo(String user_name, String user_mac) throws SQLException {
		try (Connection conn = ConnectionProvider.getConnection()) {
			return agentInfoDao.select(conn, user_name, user_mac);
		}
	}
}
