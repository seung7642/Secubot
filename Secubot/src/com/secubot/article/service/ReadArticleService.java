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
	//private ArticleContentDao contentDao = new ArticleContentDao();
	
	public ArticleData getArticle(int articleNum, boolean increaseReadCount) {
		try (Connection conn = ConnectionProvider.getConnection()) {
			
			Article article = articleDao.selectById(conn, articleNum);
			if (article == null) {
				throw new ArticleNotFoundException();
			}
			
			//ArticleContent content = contentDao.selectById(conn, articleNum);
			//if (content == null) {
				//throw new ArticleContentNotFoundException();
			//}
			
			if (increaseReadCount) {
				articleDao.increaseReadCount(conn, articleNum);
			}
			
			return new ArticleData(article);
			
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
