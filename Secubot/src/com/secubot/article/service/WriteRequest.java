package com.secubot.article.service;

import java.util.Map;
import java.util.Date;

import com.secubot.article.model.Writer;

public class WriteRequest {
	private Writer writer;
	private String title;
	private String content;
	private int trans_type;
	private String src_ip;
	private String dst_ip;
	private String dst_port;
	private Date regDate;
	
	public WriteRequest(Writer writer, String title, String content, int trans_type, 
			String src_ip, String dst_ip, String dst_port, Date date) {
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.trans_type = trans_type;
		this.src_ip = src_ip;
		this.dst_ip = dst_ip;
		this.dst_port = dst_port;
		this.regDate = date;
	}
	
	public Writer getWriter() {
		return writer;
	}

	public void setWriter(Writer writer) {
		this.writer = writer;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getTrans_type() {
		return trans_type;
	}

	public void setTrans_type(int trans_type) {
		this.trans_type = trans_type;
	}

	public String getSrc_ip() {
		return src_ip;
	}

	public void setSrc_ip(String src_ip) {
		this.src_ip = src_ip;
	}

	public String getDst_port() {
		return dst_port;
	}

	public void setDst_port(String dst_port) {
		this.dst_port = dst_port;
	}

	public String getDst_ip() {
		return dst_ip;
	}

	public void setDst_ip(String dst_ip) {
		this.dst_ip = dst_ip;
	}

	public void validate(Map<String, Boolean> errors) {
		if (title == null || title.trim().isEmpty()) {
			errors.put("title", Boolean.TRUE);
		}
	}
}
