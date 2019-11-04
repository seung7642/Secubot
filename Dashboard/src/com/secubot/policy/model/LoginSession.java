package com.secubot.policy.model;

import java.util.Date;

public class LoginSession {

	private Date login_date;
	private String agent_hash;
	private String user_name;
	private String user_phone;
	private String user_ip;
	private String user_mac;
	private String hddid;
	private String api_token;
	private int agent_no;
	private Date active_date;
	private boolean policy_updated;
	private boolean instant_policy_updated;
	private boolean software_list_update;
	private boolean usb_allow;
	
	public LoginSession(Date login_date, String agent_hash, String user_name, String user_phone, String user_ip,
			String user_mac, String hddid, String api_token, int agent_no, Date active_date, boolean policy_updated,
			boolean instant_policy_updated, boolean software_list_update, boolean usb_allow) {
		this.login_date = login_date;
		this.agent_hash = agent_hash;
		this.user_name = user_name;
		this.user_phone = user_phone;
		this.user_ip = user_ip;
		this.user_mac = user_mac;
		this.hddid = hddid;
		this.api_token = api_token;
		this.agent_no = agent_no;
		this.active_date = active_date;
		this.policy_updated = policy_updated;
		this.instant_policy_updated = instant_policy_updated;
		this.software_list_update = software_list_update;
		this.usb_allow = usb_allow;
	}
	
	public LoginSession(String agent_hash, String user_name) {
		this.agent_hash = agent_hash;
		this.user_name = user_name;
	}
	
	public Date getLogin_date() {
		return login_date;
	}
	
	public void setLogin_date(Date login_date) {
		this.login_date = login_date;
	}
	
	public String getAgent_hash() {
		return agent_hash;
	}
	
	public void setAgent_hash(String agent_hash) {
		this.agent_hash = agent_hash;
	}
	
	public String getUser_name() {
		return user_name;
	}
	
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	
	public String getUser_phone() {
		return user_phone;
	}
	
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	
	public String getUser_ip() {
		return user_ip;
	}
	
	public void setUser_ip(String user_ip) {
		this.user_ip = user_ip;
	}
	
	public String getUser_mac() {
		return user_mac;
	}
	
	public void setUser_mac(String user_mac) {
		this.user_mac = user_mac;
	}
	
	public String getHddid() {
		return hddid;
	}
	
	public void setHddid(String hddid) {
		this.hddid = hddid;
	}
	
	public String getApi_token() {
		return api_token;
	}
	
	public void setApi_token(String api_token) {
		this.api_token = api_token;
	}
	
	public int getAgent_no() {
		return agent_no;
	}
	
	public void setAgent_no(int agent_no) {
		this.agent_no = agent_no;
	}
	
	public Date getActive_date() {
		return active_date;
	}
	
	public void setActive_date(Date active_date) {
		this.active_date = active_date;
	}
	
	public boolean isPolicy_updated() {
		return policy_updated;
	}
	
	public void setPolicy_updated(boolean policy_updated) {
		this.policy_updated = policy_updated;
	}
	
	public boolean isInstant_policy_updated() {
		return instant_policy_updated;
	}
	
	public void setInstant_policy_updated(boolean instant_policy_updated) {
		this.instant_policy_updated = instant_policy_updated;
	}
	
	public boolean isSoftware_list_update() {
		return software_list_update;
	}
	
	public void setSoftware_list_update(boolean software_list_update) {
		this.software_list_update = software_list_update;
	}
	
	public boolean isUsb_allow() {
		return usb_allow;
	}
	
	public void setUsb_allow(boolean usb_allow) {
		this.usb_allow = usb_allow;
	}
}
