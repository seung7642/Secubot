package com.secubot.network.model;

import java.util.Date;

public class NetworkModel {

	private String typeName;
	private Date inTime;
	private String srcIP;
	private String dstIP;

	public NetworkModel(String typeName, Date inTime, String srcIP, String dstIP) {
		this.typeName = typeName;
		this.inTime = inTime;
		this.srcIP = srcIP;
		this.dstIP = dstIP;
	}

	public String getTypeName() {
		return typeName;
	}

	public void serTypeName(String typeName) {
		this.typeName = typeName;
	}

	public Date getInTime() {
		return inTime;
	}

	public void setInTime(Date inTime) {
		this.inTime = inTime;
	}

	public String getSrcIP() {
		return srcIP;
	}

	public void setSrcIP(String srcIP) {
		this.srcIP = srcIP;
	}

	public String getDstIP() {
		return dstIP;
	}

	public void setDstIP(String dstIP) {
		this.dstIP = dstIP;
	}
}