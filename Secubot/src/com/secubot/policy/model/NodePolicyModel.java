package com.secubot.policy.model;

public class NodePolicyModel {

	private int count;
	private String policyName;
	private String policyGroup;
	private String policy;
	private String description;
	
	NodePolicyModel(String policyName, String policyGroup, String policy, String description) {
		this.policyName = policyName;
		this.policyGroup = policyGroup;
		this.policy = policy;
		this.description = description;
	}
	
	public String getPolicyName() {
		return policyName;
	}
	
	public void setPolicyName(String policyName) {
		this.policyName = policyName;
	}
	
	public String getPolicyGroup() {
		return policyGroup;
	}
	
	public void setPolicyGroup(String policyGroup) {
		this.policyGroup = policyGroup;
	}
	
	public String getPolicy() {
		return policy;
	}
	
	public void setPolicy(String policy) {
		this.policy = policy;
	}
	
	public String getDescription() {
		return description;
	}
	
	public void setDescription(String description) {
		this.description = description;
	}
}
