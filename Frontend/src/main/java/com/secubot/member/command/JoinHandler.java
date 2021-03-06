package com.secubot.member.command;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.secubot.auth.service.User;
import com.secubot.member.service.EmailNotFoundException;
import com.secubot.member.service.DuplicateIdException;
import com.secubot.member.service.InvalidPasswordException;
import com.secubot.member.service.JoinService;
import com.secubot.member.service.JoinRequest;
import com.secubot.mvc.command.CommandHandler;

public class JoinHandler implements CommandHandler {
	
	private static final String FORM_VIEW = "/WEB-INF/view/joinForm.jsp";
	private JoinService joinService = new JoinService(); // TODO: Dependency Injection
	
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
	
	private String processSubmit(HttpServletRequest req, HttpServletResponse res) {
		JoinRequest joinReq = new JoinRequest(
				req.getParameter("id"), req.getParameter("email"), 
				req.getParameter("name"), req.getParameter("password"));
		
		Map<String, Boolean> errors = new HashMap<>();
		req.setAttribute("errors", errors);
		
		try {
			joinService.join(joinReq);
			return "/login.do";
		} catch (DuplicateIdException e) {
			errors.put("duplicateId", Boolean.TRUE);
			return FORM_VIEW;
		} catch (InvalidPasswordException e) {
			errors.put("invalidPassword", Boolean.TRUE);
			return FORM_VIEW;
		}
	}
	
	private String processForm(HttpServletRequest req, HttpServletResponse res) throws Exception {
		try {
			User user = (User) req.getSession().getAttribute("authUser");
			String email = user.getEmail();
			
			if (email.equals("") && email.isEmpty()) {
				email = req.getParameter("email");
				if (email.equals("") && email.isEmpty()) {
					throw new EmailNotFoundException();
				}
			}
			
			joinService.sendEmail(email, null); 
			res.sendRedirect(req.getContextPath() + "/index.jsp");
			return null;
		} catch (EmailNotFoundException e) {
			return FORM_VIEW;
		} catch (Exception e) {
			return FORM_VIEW;
		}
	}
}
