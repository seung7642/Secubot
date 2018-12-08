package com.secubot.policy.service;

import java.util.List;

import com.secubot.policy.model.AgentPolicy;

public class AgentPolicyPage {

	private int total;
	private List<AgentPolicy> list;
	
	public AgentPolicyPage(int total, List<AgentPolicy> list) {
		this.total = total;
		this.list = list;
	}
	
	public int getTotal() {
		return total;
	}
	
	public void setTotal(int total) {
		this.total = total;
	}
	
	public List<AgentPolicy> getList() {
		return list;
	}
	
	public void setList(List<AgentPolicy> list) {
		this.list = list;
	}
}
