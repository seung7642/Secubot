package com.secubot.member.model;

import java.util.Date;

public class Member {

	private String id;
	private String email;
	private String name;
	private String password;
	private Date regDate;
	private String registerCode;
	private boolean registerCheck;
	
	public Member(String id, String email, String name, String password, Date regDate, String registerCode,
			boolean registerCheck) {
		this.id = id;
		this.email = email;
		this.name = name;
		this.password = password;
		this.regDate = regDate;
		this.registerCode = registerCode;
		this.registerCheck = registerCheck;
	}
	
	public Member(String id, String email, String name) {
		this.id = id;
		this.email = email;
		this.name = name;
	}
	
	public String getId() {
		return id;
	}
	
	public String getEmail() {
		return email;
	}
	
	public String getName() {
		return name;
	}
	
	public String getPassword() {
		return password;
	}
	
	public Date getRegDate() {
		return regDate;
	}
	
	public String getRegisterCode() {
		return registerCode;
	}
	
	public boolean isRegisterCheck() {
		return registerCheck;
	}
	
	public void setRegisterCheck(boolean registerCheck) {
		this.registerCheck = registerCheck;
	}
	
	public boolean matchRegisterCheck(String registerCode) {
		return this.registerCode.equals(registerCode);
	}
	
	public boolean matchPassword(String pwd) {
		return this.password.equals(pwd);
	}
	
	public void changePassword(String newPwd) {
		this.password = newPwd;
	}
}