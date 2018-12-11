package com.secubot.network.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.secubot.network.service.NetworkPage;
import com.secubot.network.service.NetworkService;
import com.secubot.mvc.command.CommandHandler;

public class NetworkHandler implements CommandHandler {

	private static final String FORM_VIEW = "/WEB-INF/aside/network/main.jsp";
	private NetworkService networkService = new NetworkService();
	
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
		NetworkPage networkPage = networkService.getPage();
		req.getSession().setAttribute("networkPage", networkPage);
		return FORM_VIEW;
	}
	
	private String processSubmit(HttpServletRequest req, HttpServletResponse res) throws Exception {
		return FORM_VIEW;
	}
}
