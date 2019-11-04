package com.secubot.network.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.secubot.network.model.NetworkAsset;
import com.secubot.jdbc.JdbcUtil;

public class NetworkDao {

	public int count(Connection conn) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement("select count(*) from network_assets");
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1);
			}
			return 0;
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
	}
	
	public List<NetworkAsset> getList(Connection conn) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement("select * from network_assets");
			rs = pstmt.executeQuery();
			List<NetworkAsset> list = new ArrayList<>();
			while (rs.next()) {
				list.add(new NetworkAsset(
						rs.getString(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4)
						));
			}
			return list;
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
	}
}
