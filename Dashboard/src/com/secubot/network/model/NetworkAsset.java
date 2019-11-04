package com.secubot.network.model;

public class NetworkAsset {

	private String ip;
	private String mac;
	private String vendor;
	private String os;
	
	public NetworkAsset(String ip, String mac, String vendor, String os) {
		this.ip = ip;
		this.mac = mac;
		this.vendor = vendor;
		this.os = os;
	}
	
	public String getIp() {
		return ip;
	}
	
	public void setIp(String ip) {
		this.ip = ip;
	}
	
	public String getMac() {
		return mac;
	}
	
	public void setMac(String mac) {
		this.mac = mac;
	}
	
	public String getVendor() {
		return vendor;
	}
	
	public void setVendor(String vendor) {
		this.vendor = vendor;
	}
	
	public String getOs() {
		return os;
	}
	
	public void setOs(String os) {
		this.os = os;
	}
}
