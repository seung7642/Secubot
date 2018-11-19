package com.secubot.article.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.secubot.article.dao.ArticleDao;
import com.secubot.article.model.Article;
import com.secubot.jdbc.connection.ConnectionProvider;

public class ListArticleService {

	private ArticleDao articleDao = new ArticleDao();
	private int size = 10;
	
	public ArticlePage getArticlePage(int pageNum) {
		try (Connection conn = ConnectionProvider.getConnection()) {
			// selectCount() 메서드는 전체 게시글 수를 반환.
			int total = articleDao.selectCount(conn);
			List<Article> content = articleDao.select(
					conn, (pageNum - 1) * size, size);
			
			// 1. 전체 게시글 수
			// 2. 페이지 번호
			// 3. 1페이지당 사이즈(여기선 10개의 게시글당 1페이지로 설정)
			// 4. 게시글 내용(요청 페이지에 해당하는 글을 List<Article>로 연결한 값)
			return new ArticlePage(total, pageNum, size, content);
		} catch(SQLException e) {
			throw new RuntimeException();
		}
	}
}
