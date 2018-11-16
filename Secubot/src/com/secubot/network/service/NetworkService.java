package com.secubot.network.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.secubot.network.service.NetworkServiceModel;
import com.secubot.network.model.NetworkModel;
import com.secubot.network.dao.NetworkDao;
import com.secubot.jdbc.connection.ConnectionProvider;

public class NetworkService {
	
	private NetworkDao networkDao = new NetworkDao();
	private List<NetworkModel> networkList = new ArrayList<>();
	private int count;
	
	public List<NetworkModel> getNetworkModelList() {
		try (Connection conn = ConnectionProvider.getConnection()) {
			networkList = networkDao.select(conn);
			
			return networkList;
		} catch(SQLException e) {
			throw new RuntimeException();
		}
	}
	
	public int totalCount() {
		try (Connection conn = ConnectionProvider.getConnection()){
			count = networkDao.selectCount(conn);
			
			return count;
		} catch(SQLException e) {
			throw new RuntimeException();
		}
	}
}