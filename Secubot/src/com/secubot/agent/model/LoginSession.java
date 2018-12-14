package com.secubot.agent.model;

import java.util.Date;

public class LoginSession {

	private int agent_no;
	private String user_name;
	private String user_phone;
	private String user_ip;
	private String user_mac;
	private String agent_hash;
	private String api_token;
	private String hddid;
	private Date login_date;
	
	public LoginSession(String user_name, String user_phone, String user_ip, String user_mac, 
			String agent_hash, String api_token, String hddid) {
		this.user_name = user_name;
		this.user_phone = user_phone;
		this.user_ip = user_ip;
		this.user_mac = user_mac;
		this.agent_hash = agent_hash;
		this.api_token = api_token;
		this.hddid = hddid;
	}
	
	public String getName() {
		return user_name;
	}
	
	public void setName(String user_name) {
		this.user_name = user_name;
	}
	
	public String getPhone() {
		return user_phone;
	}
	
	public void setPhone(String user_phone) {
		this.user_phone = user_phone;
	}
	
	public String getIp() {
		return user_ip;
	}
	
	public void setIp(String user_ip) {
		this.user_ip = user_ip;
	}
	
	public String getMac() {
		return user_mac;
	}
	
	public void setMac(String user_mac) {
		this.user_mac = user_mac;
	}
}
