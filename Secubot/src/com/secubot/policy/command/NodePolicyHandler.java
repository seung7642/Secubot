package com.secubot.policy.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.secubot.policy.service.NodePolicyService;
import com.secubot.mvc.command.CommandHandler;

public class NodePolicyHandler implements CommandHandler {
	
	private final static String FORM_VIEW = "/WEB-INF/policy/listNode.jsp";
	private NodePolicyService nodePolicyService = new NodePolicyService();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
//		String pageNum = req.getAttribute("page");
//		String sort = req.getAttribute("sort");
//		int page = 1;
//		
//		if (pageNum != null) {
//			page = Integer.parseInt(pageNum);
//		}
		
		return null;
	}
}
