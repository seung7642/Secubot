package auth.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;

import auth.dao.AccessLogDao;
import auth.model.User;
import auth.model.AccessLog;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;

public class AccessLogService {

	private AccessLogDao accessLogDao = new AccessLogDao();
	
	public AccessLog logRecord(User user) throws SQLException {
		Connection conn = null;
		AccessLog accessLog = new AccessLog(
				user.getId(),
				user.getEmail(),
				user.getName(),
				new Date()
				);
		
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			accessLogDao.insert(conn, accessLog);
			
			conn.commit();
			return accessLog;
		} catch (SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(conn);
		}
	}
}
