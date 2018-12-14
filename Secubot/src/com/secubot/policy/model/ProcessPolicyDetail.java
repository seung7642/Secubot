package com.secubot.policy.model;

public class ProcessPolicyDetail {

	private int process_policy_id;
	private String policy_author;
	private String policy_description;
	private boolean flag_accept;
	private boolean flag_apply;
	private String rule_json; // MySQL json 타입 데이터
	private String image_name; // 프로세스명
	
	public ProcessPolicyDetail(int process_policy_id, String policy_author, String policy_description, boolean flag_accept, boolean flag_apply,
			String rule_json, String image_name) {
		this.process_policy_id = process_policy_id;
		this.policy_description = policy_description;
		this.policy_author = policy_author;
		this.flag_accept = flag_accept;
		this.flag_apply = flag_apply;
		this.rule_json = rule_json;
		this.image_name = image_name;
	}
	
	public ProcessPolicyDetail(String policy_author, String policy_description, boolean flag_accept, boolean flag_apply,
			String rule_json, String image_name) {
		this.policy_description = policy_description;
		this.policy_author = policy_author;
		this.flag_accept = flag_accept;
		this.flag_apply = flag_apply;
		this.rule_json = rule_json;
		this.image_name = image_name;
	}
	
	public int getProcess_policy_id() {
		return process_policy_id;
	}
	
	public void setProcess_policy_id(int process_policy_id) {
		this.process_policy_id = process_policy_id;
	}
	
	public String getPolicy_description() {
		return policy_description;
	}
	
	public void setPolicy_description(String policy_description) {
		this.policy_description = policy_description;
	}
	
	public String getPolicy_author() {
		return policy_author;
	}
	
	public void setPolicy_author(String policy_author) {
		this.policy_author = policy_author;
	}
	
	public boolean isFlag_accept() {
		return flag_accept;
	}
	
	public void setFlag_accept(boolean flag_accept) {
		this.flag_accept = flag_accept;
	}
	
	public boolean isFlag_apply() {
		return flag_apply;
	}
	
	public void setFlag_apply(boolean flag_apply) {
		this.flag_apply = flag_apply;
	}
	
	public String getRule_json() {
		return rule_json;
	}
	
	public void setRule_json(String rule_json) {
		this.rule_json = rule_json;
	}
	
	public String getImage_name() {
		return image_name;
	}
	
	public void setImage_name(String image_name) {
		this.image_name = image_name;
	}
}
