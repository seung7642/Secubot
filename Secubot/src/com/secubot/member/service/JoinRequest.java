package com.secubot.member.service;

import java.util.Map;

import com.secubot.util.RandomBox;

public class JoinRequest {

	private String id;
	private String email;
	private String name;
	private String password;
	private String registerCode;
	
	public JoinRequest(String id, String email, String name, String password) {
		this.id = id;
		this.email = email;
		this.name = name;
		this.password = password;
		this.registerCode = RandomBox.getRandomRegisterCode();
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
	
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getRegisterCode() {
		return registerCode;
	}
	
	public void validate(Map<String, Boolean> errors) {
		checkEmpty(errors, id, "id");
		checkEmpty(errors, email, "email");
		checkEmpty(errors, name, "name");
		checkEmpty(errors, password, "password");
	}
	
	private void checkEmpty(Map<String, Boolean> errors, String value, String fieldName) {
		if (value == null || value.isEmpty()) {
			errors.put(fieldName, Boolean.TRUE);
		}
	}
}