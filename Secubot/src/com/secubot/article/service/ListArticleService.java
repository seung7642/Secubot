package com.secubot.article.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.secubot.article.dao.ArticleDao;
import com.secubot.article.model.Article;
import com.secubot.jdbc.connection.ConnectionProvider;

public class ListArticleService {

	private ArticleDao articleDao = new ArticleDao();
	private int size = 100;
	
	public ArticlePage getArticlePage(int pageNum) {
		try (Connection conn = ConnectionProvider.getConnection()) {
			int total = articleDao.selectCount(conn);
			List<Article> content = articleDao.select(
					conn, (pageNum - 1) * size, size);
			
			
			return new ArticlePage(total, pageNum, size, content);
		} catch(SQLException e) {
			throw new RuntimeException();
		}
	}
}
