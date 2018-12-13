package com.secubot.agent.command;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.SQLException;

import com.secubot.agent.model.AgentInfo;
import com.secubot.agent.service.InfoAgentService;
import com.secubot.mvc.command.CommandHandler;

public class InfoAgentHandler implements CommandHandler {

	private static final String FORM_VIEW = "/WEB-INF/aside/agent/agentInfo.jsp";
	private InfoAgentService agentInfoService = new InfoAgentService();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		/*if (req.getMethod().equalsIgnoreCase("GET")) {
			return processForm(req, res);
		} else*/ 
		if (req.getMethod().equalsIgnoreCase("POST")) {
			return processSubmit(req, res);
		} else {
			res.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
			return null;
		}
	}

	private String processSubmit(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String user_name=req.getParameter("user_name");
		String user_mac=req.getParameter("user_mac");
		
		AgentInfo agentInfo = agentInfoService.getAgentInfo(user_name, user_mac);
		
		req.getSession().setAttribute("agentInfo", agentInfo);
		return FORM_VIEW;
	}
}
