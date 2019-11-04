package com.secubot.policy.model;

public class ProcessPolicy {

	private int process_policy_id;
	private String agent_hash;
	
	public ProcessPolicy(int process_policy, String agent_hash) {
		this.process_policy_id = process_policy;
		this.agent_hash = agent_hash;
	}

	public int getProcess_policy_id() {
		return process_policy_id;
	}

	public void setProcess_policy_id(int process_policy_id) {
		this.process_policy_id = process_policy_id;
	}

	public String getAgent_hash() {
		return agent_hash;
	}

	public void setAgent_hash(String agent_hash) {
		this.agent_hash = agent_hash;
	}
	
}
