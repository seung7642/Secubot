package com.secubot.auth.command;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.secubot.auth.model.User;
import com.secubot.auth.model.AccessLog;
import com.secubot.auth.service.LoginFailException;
import com.secubot.auth.service.LoginService;
import com.secubot.auth.service.AccessLogService;
import com.secubot.auth.service.PasswordNotFoundException;
import com.secubot.mvc.command.CommandHandler;

public class LoginHandler implements CommandHandler {

	private static final String FORM_VIEW = "/WEB-INF/view/loginForm.jsp";
	private LoginService loginService = new LoginService();
	private AccessLogService accessLogService = new AccessLogService();
	
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
	
	private String processForm(HttpServletRequest req, HttpServletResponse res) {
		return FORM_VIEW;
	}
	
	private String processSubmit(HttpServletRequest req, HttpServletResponse res) 
	throws Exception {
		String id = trim(req.getParameter("id"));
		String password = trim(req.getParameter("password"));
		
		Map<String, Boolean> errors = new HashMap<>();
		req.setAttribute("errors", errors);
		
		try {
			User authUser = loginService.login(id, password);
			
			// 로그 기록 저장
			AccessLog accessLog = accessLogService.logRecord(authUser);
			
			// 해당 유저 정보 세션에 저장
			req.getSession().setAttribute("authUser", authUser);
			req.getSession().setAttribute("accessLog", accessLog);
			res.sendRedirect(req.getContextPath() + "/index.jsp");
			return null;
		} catch (LoginFailException e) {
			errors.put("idOrPwNotMatch", Boolean.TRUE);
			return FORM_VIEW;
		} catch (PasswordNotFoundException e) {
			req.getSession().setAttribute("id", id);
			res.sendRedirect("/setPwd.do");
			return null;
		}
	}
	
	private String trim(String str) {
		return str == null ? null : str.trim();
	}
}
