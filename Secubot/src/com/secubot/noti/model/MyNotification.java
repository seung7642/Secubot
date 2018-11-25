package com.secubot.noti.model;

import java.util.Date;

import com.secubot.util.TransferDate;

public class MyNotification {
	private Integer number;
	private Integer articleNo;
	private Integer anotherMemberId;
	private String anotherUserNickname;
	private String type;
	private boolean readCheck;
	private Date regdate;
	private int myId;

	public MyNotification(Integer number, Integer articleNo, Integer anotherMemberId,
			String type, boolean readCheck, Date regdate, int myId) {
		this.number = number;
		this.articleNo = articleNo;
		this.anotherMemberId = anotherMemberId;
		this.type = type;
		this.readCheck = readCheck;
		this.regdate = regdate;
		this.myId = myId;
	}
	
	public MyNotification(Integer number, Integer articleNo, Integer anotherMemberId, String anotherUserNickname,
			String type, boolean readCheck, Date regdate, int myId) {
		this.number = number;
		this.articleNo = articleNo;
		this.anotherMemberId = anotherMemberId;
		this.anotherUserNickname = anotherUserNickname;
		this.type = type;
		this.readCheck = readCheck;
		this.regdate = regdate;
		this.myId = myId;
	}

	public Integer getNumber() {
		return number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}

	public Integer getArticleNo() {
		return articleNo;
	}

	public void setArticleNo(Integer articleNo) {
		this.articleNo = articleNo;
	}

	public Integer getAnotherMemberId() {
		return anotherMemberId;
	}

	public void setAnotherMemberId(Integer anotherMemberId) {
		this.anotherMemberId = anotherMemberId;
	}

	public String getAnotherUserNickname() {
		return anotherUserNickname;
	}

	public void setAnotherUserNickname(String anotherUserNickname) {
		this.anotherUserNickname = anotherUserNickname;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
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

	public int getMyId() {
		return myId;
	}

	public void setMyId(int myId) {
		this.myId = myId;
	}
	
	public String getTransferRegDate() {
		return TransferDate.getDate(regdate);
	}

}
