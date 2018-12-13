package com.secubot.article.dao;

import java.sql.Connection;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;
import java.util.ArrayList;
import java.util.Date;

import com.secubot.article.model.Article;
import com.secubot.article.model.Writer;
import com.secubot.jdbc.JdbcUtil;

public class ArticleDao {

	public Article insert(Connection conn, Article article) throws SQLException {
		Statement stmt = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			pstmt = conn.prepareStatement(
					"insert into article(writer_id, writer_name, title, reg_date, process_check, trans_type) "
							+ " values(?, ?, ?, ?, ?, ?)");
			pstmt.setString(1, article.getWriter().getId());
			pstmt.setString(2, article.getWriter().getName());
			pstmt.setString(3, article.getTitle());
			pstmt.setTimestamp(4, new Timestamp(article.getReg_date().getTime()));
			pstmt.setInt(5, article.getProcess_check());
			pstmt.setInt(6, article.getTrans_type());
			pstmt.executeUpdate();
			int insertedCount = pstmt.executeUpdate();

			if (insertedCount > 0) {
				stmt = conn.createStatement();
	
				rs = stmt.executeQuery("select last_insert_id() from article");
				if (rs.next()) {
					Integer newNo = rs.getInt(1);
					
					// rs.getString("writer_id") => Error: writer_id column을 찾을 수 없습니다.
					return new Article(
							newNo,
							article.getWriter(),
							article.getTitle(), 
							article.getReg_date(),
							article.getProcess_check(), 
							article.getTrans_type());
				}
			}
			return null;
		} finally {
			JdbcUtil.close(stmt);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
	}

	public int selectCount(Connection conn) throws SQLException {
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select count(*) from article");
			if (rs.next()) {
				return rs.getInt(1);
			}
			return 0;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
		}
	}

	public List<Article> select(Connection conn, int startRow, int size) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("select * from article " + "order by article_no desc limit ?, ?");
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, size);
			rs = pstmt.executeQuery();
			List<Article> list = new ArrayList<>();
			while (rs.next()) {
				list.add(new Article(
						rs.getInt("article_no"),
						new Writer(rs.getString("writer_id"), rs.getString("writer_name")),
						rs.getString("title"),
						new Date(rs.getTimestamp("reg_date").getTime()),
						rs.getInt("process_check"),
						rs.getInt("trans_type")
						));
			}
			return list;
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
	}

	public Article selectById(Connection conn, int article_no) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			pstmt = conn.prepareStatement("select * from article where article_no = ?");
			pstmt.setInt(1, article_no);
			rs = pstmt.executeQuery();

			Article article = null;
			if (rs.next()) {
				article = new Article(
						rs.getInt("article_no"),
						new Writer(rs.getString("writer_id"), rs.getString("writer_name")),
						rs.getString("title"),
						new Date(rs.getTimestamp("reg_date").getTime()),
						rs.getInt("process_check"),
						rs.getInt("trans_type"));
			}

			return article;
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
	}
}
