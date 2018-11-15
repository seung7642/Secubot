package com.secubot.auth.service;

public class User {

	private String id;
	private String name;
	private String email;
	private boolean registerCheck;
	private boolean hasPassword;
	
	public User(String id, String name, String email, boolean registerCheck, boolean hasPassword) {
		this.id = id;
		this.name = name;
		this.email = email;
		this.registerCheck = registerCheck;
		this.hasPassword = hasPassword;
	}
	
	public User(String id) {
		this.id = id;
	}
	
	public String getId() {
		return id;
	}
	
	public String getName() {
		return name;
	}
	
	public String getEmail() {
		return email;
	}
	
	public boolean isRegisterCheck() {
		return registerCheck;
	}
	
	public boolean getHasPassword() {
		return hasPassword;
	}
	
	public void setHasPassword(boolean passwordCheck) {
		this.hasPassword = passwordCheck;
	}
}