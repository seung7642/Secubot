package com.secubot.article.service;

import java.sql.Connection;
import java.sql.SQLException;

import com.secubot.article.dao.ArticleDao;
import com.secubot.jdbc.connection.ConnectionProvider;

public class CheckArticleService {

	private ArticleDao articleDao = new ArticleDao();
	
	public void update(int cnt, int article_no) throws SQLException {
		try (Connection conn = ConnectionProvider.getConnection()) {
			
			articleDao.updateCheck(conn, cnt, article_no);
		}
	}
}
