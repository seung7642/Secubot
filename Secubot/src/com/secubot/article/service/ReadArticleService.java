package com.secubot.article.service;

import java.sql.Connection;
import java.sql.SQLException;

import com.secubot.article.dao.ArticleDao;
import com.secubot.article.dao.ArticleContentDao;
import com.secubot.article.model.Article;
import com.secubot.article.model.ArticleContent;
import com.secubot.jdbc.connection.ConnectionProvider;

public class ReadArticleService {

	private ArticleDao articleDao = new ArticleDao();
	private ArticleContentDao contentDao = new ArticleContentDao();
	
	public ArticleData getArticle(int article_no) {
		try (Connection conn = ConnectionProvider.getConnection()) {
			
			Article article = articleDao.selectById(conn, article_no);
			if (article == null) {
				throw new ArticleNotFoundException();
			}
			
			// TODO: ArticleContent를 못 받아옴.
			ArticleContent content = contentDao.selectById(conn, article_no);
			if (content == null) {
				throw new ArticleContentNotFoundException();
			}
			
			return new ArticleData(article, content);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
