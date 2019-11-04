package com.secubot.article.model;

import java.util.Date;

public class Article {
	
	private int article_no;
	private Writer writer;
	private String title;
	private Date reg_date;
	private int process_check;
	private int trans_type;
	
	public Article(int article_no, Writer writer, String title, Date reg_date, int process_check, int trans_type) {
		this.article_no = article_no;
		this.writer = writer;
		this.title = title;
		this.reg_date = reg_date;
		this.process_check = process_check;
		this.trans_type = trans_type;
	}
	
	public Article(Writer writer, String title, Date reg_date, int process_check, int trans_type) {
		this.writer = writer;
		this.title = title;
		this.reg_date = reg_date;
		this.process_check = process_check;
		this.trans_type = trans_type;
	}
	
	public int getArticle_no() {
		return article_no;
	}
	
	public void setArticle_no(int article_no) {
		this.article_no = article_no;
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
	
	public Date getReg_date() {
		return reg_date;
	}
	
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	
	public int getProcess_check() {
		return process_check;
	}
	
	public void setProcess_check(int process_check) {
		this.process_check = process_check;
	}
	
	public int getTrans_type() {
		return trans_type;
	}
	
	public void setTrans_type(int trans_type) {
		this.trans_type = trans_type;
	}
}
