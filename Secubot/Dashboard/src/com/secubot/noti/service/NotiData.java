package com.secubot.noti.service;

import java.util.List;

import com.secubot.noti.model.MyNotification;

public class NotiData {
	private List<MyNotification> notiList;
	
	public NotiData(List<MyNotification> notiList) {
		this.notiList = notiList;
	}

	public List<MyNotification> getNotiList() {
		return notiList;
	}

	public void setNotiList(List<MyNotification> notiList) {
		this.notiList = notiList;
	}

	public int getTotNotisize() {
		return notiList.size();
	}

	public boolean hasNotiList() {
		return notiList.size() > 0;
	}
}
