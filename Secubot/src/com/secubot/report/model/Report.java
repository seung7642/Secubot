package com.secubot.report.model;

import java.util.Date;

public class Report {

	private Date report_date;
	private int count_receipt_complaint;
	private int count_treatment_complaint;
	private int count_detection;
	private int count_correspond;
	
	public Report(Date report_date, int count_receipt_complaint, int count_treatment_complaint, 
			int count_detection, int count_correspond) {
		this.report_date = report_date;
		this.count_receipt_complaint = count_receipt_complaint;
		this.count_treatment_complaint = count_treatment_complaint;
		this.count_detection = count_detection;
		this.count_correspond = count_correspond;
	}
	
	public Date getDate() {
		return report_date;
	}
	
	public void setDate(Date report_date) {
		this.report_date = report_date;
	}
	
	public int getCountReceipt() {
		return count_receipt_complaint;
	}
	
	public void setCountReceipt(int count_receipt_complaint) {
		this.count_receipt_complaint = count_receipt_complaint;
	}
	
	public int getCountTreatment() {
		return count_treatment_complaint;
	}
	
	public void setCountTreatment(int count_treatment_complaint) {
		this.count_treatment_complaint = count_treatment_complaint;
	}
	
	public int getCountDetection() {
		return count_detection;
	}
	
	public void setCountDetection(int count_detection) {
		this.count_detection = count_detection;
	}
	
	public int getCountCorrespond() {
		return count_correspond;
	}
	
	public void setCountCorrespond(int count_correspond) {
		this.count_correspond = count_correspond;
	}
}
