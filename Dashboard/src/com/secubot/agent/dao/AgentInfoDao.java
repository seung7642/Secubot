package com.secubot.agent.dao;

import java.io.UnsupportedEncodingException;
import java.lang.reflect.Type;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.google.gson.reflect.TypeToken;
import com.secubot.agent.model.AgentInfo;
import com.secubot.agent.model.LoginSession;
import com.secubot.agent.model.swInfo;
import com.secubot.jdbc.JdbcUtil;

public class AgentInfoDao {

	@SuppressWarnings("resource")
	public AgentInfo select(Connection conn,String user_name, String user_mac) throws SQLException{
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			//pstmt = conn.prepareStatement("select * from agent_info ai, login_session ls WHERE ls.user_name=? and ls.user_mac=? and ls.agent_hash=ai.agent_hash;");
			//pstmt.setString(1,user_name);
			//pstmt.setString(2,user_mac);
			Statement s = conn.createStatement( );
			rs = s.executeQuery("select * from agent_info ai, login_session ls WHERE ls.user_name=\""+ user_name + "\" and ls.user_mac=\"" + user_mac + "\" and ls.agent_hash=ai.agent_hash;");
			AgentInfo result;
			if (rs.next()) {
				result = new AgentInfo(rs.getString("agent_hash"), rs.getString("agent_cpu"),rs.getInt("agent_ram"),rs.getString("agent_os"),rs.getString("agent_hostname"));
				result.agent_ip = rs.getString("user_ip");
				result.agent_mac = rs.getString("user_mac");
				result.agent_recent_login = rs.getString("login_date");
			}
			else {
				result = new AgentInfo("","",-1,"","");
			}
			
			rs = s.executeQuery("SELECT sd.xml_data FROM agent_sysmon_setting ss, sysmon_setting sd WHERE ss.agent_hash=\"" + result.getAgent_hash() + "\" and ss.xml_id=sd.xml_id;");
			if (rs.next()) {
				result.setAgent_xml(rs.getString("xml_data"));
			}
			else {
				rs = s.executeQuery("SELECT xml_data from sysmon_setting where xml_id=1");
				if (rs.next()) {
					result.setAgent_xml(rs.getString("xml_data"));
				}
			}
			
			result.swList = new swInfo[1];
			rs = s.executeQuery("SELECT software_list FROM agent_software WHERE agent_hash=\"" + result.getAgent_hash() + "\";");
			
			if (rs.next()) {
				String swJson = rs.getString("software_list");
				try {
					swJson =  new String(swJson.getBytes("WINDOWS-1251"));
				} catch (UnsupportedEncodingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				Gson gson = new Gson();
				result.swList= gson.fromJson(swJson, swInfo[].class);
			}
			return result;
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
	}
	
}
