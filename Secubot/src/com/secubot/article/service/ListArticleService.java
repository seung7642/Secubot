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
			// selectCount() �޼���� ��ü �Խñ� ���� ��ȯ.
			int total = articleDao.selectCount(conn);
			List<Article> content = articleDao.select(
					conn, (pageNum - 1) * size, size);
			
			// 1. ��ü �Խñ� ��
			// 2. ������ ��ȣ
			// 3. 1�������� ������(���⼱ 10���� �Խñ۴� 1�������� ����)
			// 4. �Խñ� ����(��û �������� �ش��ϴ� ���� List<Article>�� ������ ��)
			return new ArticlePage(total, pageNum, size, content);
		} catch(SQLException e) {
			throw new RuntimeException();
		}
	}
}
