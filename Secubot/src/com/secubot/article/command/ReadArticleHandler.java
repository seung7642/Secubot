package com.secubot.article.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.secubot.article.service.ArticleContentNotFoundException;
import com.secubot.article.service.ArticleNotFoundException;
import com.secubot.article.service.ArticleData;
import com.secubot.article.service.ReadArticleService;
import com.secubot.mvc.command.CommandHandler;

public class ReadArticleHandler implements CommandHandler {
	
	private ReadArticleService readService = new ReadArticleService();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		// Read �ڵ鷯�� ��û�� ��, �Ķ���ͷ� article_no ���� ���� �Ѱ��ش�.
		String noVal = req.getParameter("no");
		int articleNum = Integer.parseInt(noVal);
		
		try {
			ArticleData articleData = readService.getArticle(articleNum, true);
			req.setAttribute("articleData", articleData);
			return "/WEB-INF/aside/desk/readComplaints.jsp";
		} catch (ArticleNotFoundException | ArticleContentNotFoundException e) {
			req.getServletContext().log("no article", e);
			res.sendError(HttpServletResponse.SC_NOT_FOUND);
			return null;
		}
	}
}
