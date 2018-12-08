package com.secubot.policy.model;

public class AgentPolicy {

	private String policy_name;
	private String process_name;
	
	public AgentPolicy(String policy_name, String process_name) {
		this.policy_name = policy_name;
		this.process_name = process_name;
	}
	
	public String getPolicyName() {
		return policy_name;
	}
	
	public void setPolicyName(String policy_name) {
		this.policy_name = policy_name;
	}
	
	public String getProcessName() {
		return process_name;
	}
	
	public void setProcessName(String process_name) {
		this.process_name = process_name;
	}
}
