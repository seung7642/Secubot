package com.secubot.agent.model;

import java.util.List;

public class AgentPage {

	private int total;
	private List<LoginSession> list;
	
	public AgentPage(int total, List<LoginSession> list) {
		this.total = total;
		this.list = list;
	}
	
	public int getTotal() {
		return total;
	}
	
	public void setTotal(int total) {
		this.total = total;
	}
	
	public boolean hasAgentList() {
		return total > 0;
	}
}
