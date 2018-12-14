package com.secubot.policy.command;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.secubot.policy.model.LoginSession;
import com.secubot.policy.service.AgentPolicyPage;
import com.secubot.policy.service.AgentPolicyService;
import com.secubot.auth.service.User;
import com.secubot.mvc.command.CommandHandler;

public class AgentPolicyHandler implements CommandHandler {

	private static final String FORM_VIEW = "/WEB-INF/aside/policy/agentPolicy.jsp";
	private AgentPolicyService agentService = new AgentPolicyService();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if (req.getMethod().equalsIgnoreCase("GET")) {
			return processForm(req, res);
		} else if (req.getMethod().equalsIgnoreCase("POST")) {
			return processSubmit(req, res);
		} else {
			res.setStatus(res.SC_METHOD_NOT_ALLOWED);
			return null;
		}
	}
	
	private String processForm(HttpServletRequest req, HttpServletResponse res) throws SQLException {
		// TODO: login_session 테이블에서 리스트 가져와서 속성으로 등록하기
		AgentPolicyPage agentPolicyPage = agentService.getAgentPage();
		List<LoginSession> list = agentService.getList();
		req.setAttribute("agentPolicyPage", agentPolicyPage);
		req.setAttribute("list", list);
		return FORM_VIEW;
	}
	
	private String processSubmit(HttpServletRequest req, HttpServletResponse res) throws Exception {
		User user = (User)req.getSession(false).getAttribute("authUser");
		String policy_description = (String)req.getParameter("policy_description");
		String process_name = (String)req.getParameter("process_name");
		String rule_json = (String)req.getParameter("rule_json");
		String agent_hash = (String)req.getParameter("agent_hash");
		agentService.addProcessPolicyDetail(user, policy_description, process_name, rule_json, agent_hash);
		
		return "/WEB-INF/aside/policy/policySuccess.jsp";
	}
}
