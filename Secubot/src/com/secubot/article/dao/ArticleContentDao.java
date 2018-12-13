package com.secubot.article.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.secubot.article.model.ArticleContent;
import com.secubot.jdbc.JdbcUtil;
import com.secubot.jdbc.connection.ConnectionProvider;

public class ArticleContentDao {

	public ArticleContent insert(Connection conn, ArticleContent content) throws SQLException {
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement("insert into article_content "
					+ "(article_no, content, src_ip, dst_ip, dst_port) "
					+ "values(?, ?, ?, ?, ?)");
			pstmt.setLong(1, content.getArticle_no());
			pstmt.setString(2, content.getContent());
			pstmt.setString(3, content.getSrc_ip());
			pstmt.setString(4, content.getDst_ip());
			pstmt.setInt(5, content.getDst_port());
			int insertedCount = pstmt.executeUpdate();
			
			if (insertedCount > 0) {
				return content;
			} else {
				return null;
			}
		} finally {
			JdbcUtil.close(pstmt);
		}
	}
	
	public ArticleContent selectById(Connection conn, int article_no) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement("select * from article_content where article_no = ?");
			pstmt.setInt(1, article_no);
			rs = pstmt.executeQuery();
			
			ArticleContent content = null;
			if (rs.next()) {
				content = new ArticleContent(
						rs.getInt("article_no"), 
						rs.getString("content"),
						rs.getString("src_ip"),
						rs.getString("dst_ip"),
						rs.getInt("dst_port"));
			}
			return content;
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
	}
	
	public int update(Connection conn, int no, String content) throws SQLException {
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement("update article_content set content = ? "
					+ "where article_no = ?");
			pstmt.setString(1, content);
			pstmt.setInt(2, no);
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new RuntimeException();
		}
	}
}
