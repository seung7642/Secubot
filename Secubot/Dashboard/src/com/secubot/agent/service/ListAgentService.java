package com.secubot.agent.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.secubot.agent.dao.AgentDao;
import com.secubot.agent.model.LoginSession;
import com.secubot.agent.model.AgentPage;
import com.secubot.jdbc.connection.ConnectionProvider;

public class ListAgentService {

	private AgentDao agentDao = new AgentDao();
	
	public AgentPage getAgentList() throws SQLException {
		try (Connection conn = ConnectionProvider.getConnection()) {
			int total = agentDao.selectCount(conn); // 등록된 Agent의 총 갯수를 반환
			List<LoginSession> list = agentDao.select(conn);
			return new AgentPage(total, list);
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
