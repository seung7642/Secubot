package com.secubot.auth.model;

import java.util.Date;

public class AccessLog {

	private int logNum;
	private String id;
	private String email;
	private String name;
	private Date log;
	
	public AccessLog(String id, String email, String name, Date log) {
		this.id = id;
		this.email = email;
		this.name = name;
		this.log = log;
	}
	
	public int getLogNum() {
		return logNum;
	}
	
	public void setLogNum(int logNum) {
		this.logNum = logNum;
	}
	
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public Date getLog() {
		return log;
	}
	
	public void setLog(Date log) {
		this.log = log;
	}
}
