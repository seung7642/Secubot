package com.secubot.network.service;

import java.util.List;

import com.secubot.network.model.NetworkAsset;

public class NetworkPage {

	private int total;
	private List<NetworkAsset> list;
	
	public NetworkPage(int total, List<NetworkAsset> list) {
		this.total = total;
		this.list = list;
	}
	
	public int getTotal() {
		return total;
	}
	
	public void setTotal(int total) {
		this.total = total;
	}
	
	public List<NetworkAsset> getList() {
		return list;
	}
	
	public void setList(List<NetworkAsset> list) {
		this.list = list;
	}
}
