package com.secubot.article.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;

import javax.management.RuntimeErrorException;

import com.secubot.article.dao.ArticleDao;
import com.secubot.article.dao.ArticleContentDao;
import com.secubot.article.model.Article;
import com.secubot.article.model.ArticleContent;
import com.secubot.jdbc.JdbcUtil;
import com.secubot.jdbc.connection.ConnectionProvider;

public class WriteArticleService {

	private ArticleDao articleDao = new ArticleDao();
	private ArticleContentDao contentDao = new ArticleContentDao();
	
	public Integer write(WriteRequest writeReq) {
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			Article article = toArticle(writeReq);
			Article savedArticle = articleDao.insert(conn, article);
			if (savedArticle == null) {
				throw new RuntimeException("fail to insert article");
			}
			
			ArticleContent content = new ArticleContent(
					savedArticle.getArticle_no(),
					writeReq.getContent(),
					writeReq.getSrc_ip(),
					writeReq.getDst_ip(),
					writeReq.getDst_port()
					);
			ArticleContent savedContent = contentDao.insert(conn, content);
			if (savedContent == null) {
				throw new RuntimeException("fail to insert article_content");
			}
			
			conn.commit();
			
			return savedArticle.getArticle_no();
		} catch (SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException(e);
		} catch (RuntimeException e) {
			JdbcUtil.rollback(conn);
			throw e;
		} finally {
			JdbcUtil.close(conn);
		}
	}
	
	private Article toArticle(WriteRequest writeReq) {
		return new Article(
				writeReq.getWriter(),
				writeReq.getTitle(),
				writeReq.getRegDate(),
				0,
				writeReq.getTrans_type());
	}
}
