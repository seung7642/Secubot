package com.secubot.policy.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.secubot.policy.service.AgentPolicyService;
import com.secubot.mvc.command.CommandHandler;

public class AgentPolicyHandler implements CommandHandler {

	private static final String FORM_VIEW = "/WEB-INF/aside/policy/policy.jsp";
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
	
	private String processForm(HttpServletRequest req, HttpServletResponse res) {
		// TODO: policy_process 테이블의 레코드들을 받아와 req.setAttribute 설정
		
		return FORM_VIEW;
	}
	
	private String processSubmit(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String policy_name = (String)req.getParameter("policy_name");
		String process_name = (String)req.getParameter("process_name");
		agentService.addAgentPolicy(policy_name, process_name);
		
		return "/WEB-INF/aside/policy/policySuccess.jsp";
	}
}
