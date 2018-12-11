package com.secubot.network.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.secubot.network.model.NetworkAsset;
import com.secubot.network.dao.NetworkDao;
import com.secubot.jdbc.connection.ConnectionProvider;

public class NetworkService {

	private NetworkDao networkDao = new NetworkDao();
	
	public NetworkPage getPage() throws SQLException {
		try (Connection conn = ConnectionProvider.getConnection()) {
			int total = networkDao.count(conn);
			List<NetworkAsset> list = networkDao.getList(conn);
			return new NetworkPage(total, list);
		}
	}
}
