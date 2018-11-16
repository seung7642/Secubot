package com.secubot.network.service;

import java.util.ArrayList;
import java.util.List;

import com.secubot.network.model.NetworkModel;

public class NetworkServiceModel {

	private List<NetworkModel> networkList;
	private int count;
	
	public NetworkServiceModel() {
		
	}
	
	public NetworkServiceModel(List<NetworkModel> networkList, int count) {
		this.networkList = networkList;
		this.count = count;
	}
	
	public List<NetworkModel> getNetworkList() {
		return networkList;
	}
	
	public void setNetworkList(List<NetworkModel> networkList) {
		this.networkList = networkList;
	}
	
	public int getCount() {
		return count;
	}
	
	public void setCount(int count) {
		this.count = count;
	}
}