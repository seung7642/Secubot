package com.secubot.agent.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.secubot.agent.model.AgentInfo;
import com.secubot.agent.model.LoginSession;
import com.secubot.jdbc.JdbcUtil;

public class AgentInfoDao {

	public AgentInfo select(Connection conn,String user_name, String user_mac) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement("select ai.* from agent_info ai, login_session ls WHERE ls.user_name=? and ls.user_mac=? and ls.agent_hash=ai.agent_hash;");
			pstmt.setString(1,user_name);
			pstmt.setString(2,user_mac);
			
			rs = pstmt.executeQuery();
			rs.next();
			AgentInfo result = new AgentInfo(rs.getString("agent_hash"), rs.getString("agent_cpu"),rs.getInt("agent_ram"),rs.getString("agent_os"),rs.getString("agent_hostname"));
			
			return result;
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
	}
	
}
