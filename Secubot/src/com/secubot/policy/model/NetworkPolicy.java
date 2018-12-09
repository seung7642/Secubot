package com.secubot.policy.model;

public class NetworkPolicy {

	private String policy_name;
	private String src_ip;
	private String dst_ip;
	private String port;
	
	public NetworkPolicy(String policy_name, String src_ip, String dst_ip, String port) {
		this.policy_name = policy_name;
		this.src_ip = src_ip;
		this.dst_ip = dst_ip;
		this.port = port;
	}
	
	public String getPolicyName() {
		return policy_name;
	}
	
	public void setPolicyName(String policy_name) {
		this.policy_name = policy_name;
	}
	
	public String getSrcIP() {
		return src_ip;
	}
	
	public void setSrcIP(String src_ip) {
		this.src_ip = src_ip;
	}
	
	public String getDstIP() {
		return dst_ip;
	}
	
	public void setDstIP(String dst_ip) {
		this.dst_ip = dst_ip;
	}
	
	public String getPort() {
		return port;
	}
	
	public void setPort(String port) {
		this.port = port;
	}
}
