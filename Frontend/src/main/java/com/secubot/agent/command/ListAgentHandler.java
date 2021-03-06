package com.secubot.agent.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.SQLException;

import com.secubot.agent.model.AgentPage;
import com.secubot.agent.service.ListAgentService;
import com.secubot.mvc.command.CommandHandler;

public class ListAgentHandler implements CommandHandler {

	private static final String FORM_VIEW = "/WEB-INF/aside/agent/agentList.jsp";
	private ListAgentService agentService = new ListAgentService();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if (req.getMethod().equalsIgnoreCase("GET")) {
			return processForm(req, res);
		} else if (req.getMethod().equalsIgnoreCase("POST")) {
			return processSubmit(req, res);
		} else {
			res.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
			return null;
		}
	}

	private String processForm(HttpServletRequest req, HttpServletResponse res) throws SQLException {
		AgentPage agentPage = agentService.getAgentList();
		req.getSession().setAttribute("agentPage", agentPage);
		return FORM_VIEW;
	}

	private String processSubmit(HttpServletRequest req, HttpServletResponse res) throws Exception {
		return FORM_VIEW;
	}
}
