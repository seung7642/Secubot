package com.secubot.policy.service;

import java.util.List;

import com.secubot.policy.model.NetworkPolicy;

public class NetworkPolicyPage {

	private int total;
	private List<NetworkPolicy> list;
	
	public NetworkPolicyPage(int total, List<NetworkPolicy> list) {
		this.total = total;
		this.list = list;
	}
	
	public int getTotal() {
		return total;
	}
	
	public void setTotal(int total) {
		this.total = total;
	}
	
	public List<NetworkPolicy> getList() {
		return list;
	}
	
	public void setList(List<NetworkPolicy> list) {
		this.list = list;
	}
}
