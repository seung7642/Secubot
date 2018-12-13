package com.secubot.noti.model;

import java.util.Date;

import com.secubot.article.model.Writer;
import com.secubot.util.TransferDate;

public class MyNotification {
	private Integer notiNo;
	private Integer articleNo;
	private Writer writer;
	private boolean readCheck;
	private Date regdate;

	public MyNotification(Integer articleNo, Writer writer, boolean readCheck, Date regdate) {
		this.articleNo = articleNo;
		this.writer = writer;
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
	
	public Writer getWriter() {
		return writer;
	}
	
	public void setWriter(Writer writer) {
		this.writer = writer;
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
