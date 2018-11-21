package com.secubot.article.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.secubot.article.service.ArticleContentNotFoundException;
import com.secubot.article.service.ArticleNotFoundException;
import com.secubot.article.service.ArticleData;
import com.secubot.article.service.ReadArticleService;
import com.secubot.mvc.command.CommandHandler;

public class ReadArticleHandler implements CommandHandler {
	
	private String FORM_VIEW = "/WEB-INF/aside/desk/readComplaints.jsp";
	private ReadArticleService readService = new ReadArticleService();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String noVal = req.getParameter("no");
		int articleNum = Integer.parseInt(noVal);
		
		try {
			ArticleData articleData = readService.getArticle(articleNum, true);
			req.setAttribute("articleData", articleData);
			return FORM_VIEW;
		} catch (ArticleContentNotFoundException | ArticleNotFoundException e) {
			req.getServletContext().log("no article", e);
			res.sendError(HttpServletResponse.SC_NOT_FOUND);
			return null;
		}
	}
}
