package com.secubot.network.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.ArrayList;
import java.util.List;

import com.secubot.network.model.NetworkModel;
import com.secubot.jdbc.JdbcUtil;
import com.secubot.jdbc.connection.ConnectionProvider;

public class NetworkDao {

	public List<NetworkModel> select(Connection conn) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement
					("select * from siem.ruleresult");
			rs = pstmt.executeQuery();
			
			List<NetworkModel> netList = new ArrayList<>();
			while(rs.next()) {
				netList.add(convertNetworkModel(rs, conn));
			}
			
			return netList;
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
	}
	
	private NetworkModel convertNetworkModel(ResultSet rs, Connection conn) throws SQLException {
		return new NetworkModel(
				rs.getString("netType"),
				toDate(rs.getTimestamp("inTime")),
				rs.getString("src_ip"),
				rs.getString("dst_ip")
				);
	}
	
	private Date toDate(Timestamp timestamp) {
		return timestamp == null ? null : new Date(timestamp.getTime());
	}
	
	public int selectCount(Connection conn) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement
					("select count(*) as count from siem.ruleresult");
			int countNum = 0;
			rs = pstmt.executeQuery();
			while(rs.next()) {
				countNum = rs.getInt("count");
			}
			
			return countNum;
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
	}
}