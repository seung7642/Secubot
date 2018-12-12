package com.secubot.agent.model;

import java.util.Date;

public class AgentInfo {

	private String agent_hash;
	private String agent_cpu;
	private int agent_ram;
	private String agent_os;
	private String agent_hostname;
	private String agent_xml;
	
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
