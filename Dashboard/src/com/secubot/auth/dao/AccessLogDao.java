package com.secubot.auth.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;

import com.secubot.auth.model.AccessLog;

public class AccessLogDao {

	public void insert(Connection conn, AccessLog accessLog) throws SQLException {
		try (PreparedStatement pstmt = conn.prepareStatement(
				"insert into log(id, email, name, log) values(?, ?, ?, ?)")) {
			pstmt.setString(1, accessLog.getId());
			pstmt.setString(2, accessLog.getEmail());
			pstmt.setString(3, accessLog.getName());
			pstmt.setTimestamp(4, new Timestamp(accessLog.getLog().getTime()));
			pstmt.executeUpdate();
		}
	}
	
}
