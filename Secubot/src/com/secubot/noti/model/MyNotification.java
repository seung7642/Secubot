package com.secubot.noti.model;

import java.util.Date;

import com.secubot.util.TransferDate;

public class MyNotification {
	private Integer notiNo;
	private Integer articleNo;
	private String writer_id;
	private String writer_name;
	private boolean readCheck;
	private Date regdate;

	public MyNotification(Integer articleNo, String writer_id, 
			String writer_name, boolean readCheck, Date regdate) {
		this.articleNo = articleNo;
		this.writer_id = writer_id;
		this.writer_name = writer_name;
		this.readCheck = readCheck;
		this.regdate = regdate;
	}

	public Integer getNotiNo() {
		return notiNo;
	}

	public void setNotiNo(Integer notiNo) {
		this.notiNo = notiNo;
	}

	public Integer getArticleNo() {
		return articleNo;
	}

	public void setArticleNo(Integer articleNo) {
		this.articleNo = articleNo;
	}
	
	public String getId() {
		return writer_id;
	}
	
	public void setId(String writer_id) {
		this.writer_id = writer_id;
	}
	
	public String getName() {
		return writer_name;
	}
	
	public void setName(String writer_name) {
		this.writer_name = writer_name;
	}

	public boolean isReadCheck() {
		return readCheck;
	}

	public void setReadCheck(boolean readCheck) {
		this.readCheck = readCheck;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public String getTransferRegDate() {
		return TransferDate.getDate(regdate);
	}

}
