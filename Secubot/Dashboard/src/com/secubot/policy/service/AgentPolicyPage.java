package com.secubot.policy.service;

import java.util.List;

import com.secubot.policy.model.ProcessPolicyDetail;

public class AgentPolicyPage {

	private int total;
	private List<ProcessPolicyDetail> list;
	
	public AgentPolicyPage(int total, List<ProcessPolicyDetail> list) {
		this.total = total;
		this.list = list;
	}
	
	public int getTotal() {
		return total;
	}
	
	public void setTotal(int total) {
		this.total = total;
	}
	
	public List<ProcessPolicyDetail> getList() {
		return list;
	}
	
	public void setList(List<ProcessPolicyDetail> list) {
		this.list = list;
	}
}
