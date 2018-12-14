package com.secubot.article.service;

import java.sql.Connection;
import java.sql.SQLException;

import com.secubot.article.dao.ArticleContentDao;
import com.secubot.article.dao.ArticleDao;
import com.secubot.article.model.Article;
import com.secubot.article.model.ArticleContent;
import com.secubot.auth.service.User;
import com.secubot.jdbc.connection.ConnectionProvider;
import com.secubot.util.SendEmail;

public class CheckArticleService {

	private ArticleDao articleDao = new ArticleDao();
	private ArticleContentDao contentDao = new ArticleContentDao();
	
	public void update(int cnt, int article_no) throws SQLException {
		try (Connection conn = ConnectionProvider.getConnection()) {
			
			articleDao.updateCheck(conn, cnt, article_no);
		}
	}
	
	public void checkEmail(User user, int article_no) throws SQLException {
		try (Connection conn = ConnectionProvider.getConnection()) {
			ArticleContent content = contentDao.selectById(conn, article_no);
			Article article = articleDao.selectById(conn, article_no);
			SendEmail.send(user, new ArticleData(article, content));
		}
	}
}
