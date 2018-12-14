package com.secubot.article.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.secubot.article.service.CheckArticleService;
import com.secubot.auth.service.User;
import com.secubot.mvc.command.CommandHandler;

public class CheckArticleHandler implements CommandHandler {

	private CheckArticleService check = new CheckArticleService();
	private static final String FORM_VIEW = "/WEB-INF/aside/desk/checkSuccess.jsp";
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws SQLException {
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
		String param = req.getParameter("article_no");
		int article_no = Integer.parseInt(param);
		int cnt = 1; // 지금은 비승인 / 승인 2가지 상태만 있다.
		check.update(cnt, article_no);
		
		User user = (User)req.getSession(false).getAttribute("authUser");
		check.checkEmail(user, article_no);
		return FORM_VIEW;
	}
	
	private String processSubmit(HttpServletRequest req, HttpServletResponse res) {
		return FORM_VIEW;
	}
	
}
