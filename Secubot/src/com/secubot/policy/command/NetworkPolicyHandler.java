package com.secubot.policy.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.secubot.policy.service.NetworkPolicyService;
import com.secubot.mvc.command.CommandHandler;

public class NetworkPolicyHandler implements CommandHandler {

	private static final String FORM_VIEW = "/WEB-INF/aside/policy/policy.jsp";
	private NetworkPolicyService policyService = new NetworkPolicyService();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws SQLException {
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
		return FORM_VIEW;
	}
	
	private String processSubmit(HttpServletRequest req, HttpServletResponse res) throws SQLException {
		String policy_name = req.getParameter("policy_name");
		String src_ip = req.getParameter("src_ip");
		String dst_ip = req.getParameter("dst_ip");
		String port = req.getParameter("port");
		policyService.addPolicy(policy_name, src_ip, dst_ip, port);
		return "/WEB-INF/aside/policy/policySuccess.jsp";
	}
}
