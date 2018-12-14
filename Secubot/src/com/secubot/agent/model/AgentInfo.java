package com.secubot.agent.model;


public class AgentInfo {


	public String agent_hash;
	public String agent_cpu;
	public int agent_ram;
	public String agent_os;
	public String agent_hostname;
	public String agent_xml;
	public String agent_ip;
	public String agent_mac;
	public String agent_recent_login;
	public swInfo[] swList;
	
	public swInfo[] getSwList() {
		return swList;
	}
	public void setSwList(swInfo[] swList) {
		this.swList = swList;
	}
	public AgentInfo(String agent_hash, String agent_cpu, int agent_ram, String agent_os, String agent_hostname, String agent_xml) {
		this.agent_hash = agent_hash;
		this.agent_cpu = agent_cpu;
		this.agent_ram = agent_ram;
		this.agent_os = agent_os;
		this.agent_hostname = agent_hostname;
		this.agent_xml = agent_xml;
	}
	public AgentInfo(String agent_hash, String agent_cpu, int agent_ram, String agent_os, String agent_hostname) {
		this.agent_hash = agent_hash;
		this.agent_cpu = agent_cpu;
		this.agent_ram = agent_ram;
		this.agent_os = agent_os;
		this.agent_hostname = agent_hostname;
	}
	public AgentInfo() {
		// TODO Auto-generated constructor stub
	}
	public String getAgent_ip() {
		return agent_ip;
	}
	public void setAgent_ip(String agent_ip) {
		this.agent_ip = agent_ip;
	}
	public String getAgent_mac() {
		return agent_mac;
	}
	public void setAgent_mac(String agent_mac) {
		this.agent_mac = agent_mac;
	}
	public String getAgent_recent_login() {
		return agent_recent_login;
	}
	public void setAgent_recent_login(String agent_recent_login) {
		this.agent_recent_login = agent_recent_login;
	}
	public String getAgent_hash() {
		return agent_hash;
	}
	public void setAgent_hash(String agent_hash) {
		this.agent_hash = agent_hash;
	}
	public String getAgent_cpu() {
		return agent_cpu;
	}
	public void setAgent_cpu(String agent_cpu) {
		this.agent_cpu = agent_cpu;
	}
	public int getAgent_ram() {
		return agent_ram;
	}
	public void setAgent_ram(int agent_ram) {
		this.agent_ram = agent_ram;
	}
	public String getAgent_os() {
		return agent_os;
	}
	public void setAgent_os(String agent_os) {
		this.agent_os = agent_os;
	}
	public String getAgent_hostname() {
		return agent_hostname;
	}
	public void setAgent_hostname(String agent_hostname) {
		this.agent_hostname = agent_hostname;
	}
	public String getAgent_xml() {
		return agent_xml;
	}
	public void setAgent_xml(String agent_xml) {
		this.agent_xml = agent_xml;
	}

	
	
}
