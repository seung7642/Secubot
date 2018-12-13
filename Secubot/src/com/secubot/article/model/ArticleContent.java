package com.secubot.article.model;

public class ArticleContent {

	private int article_no;
	private String content;
	private String src_ip;
	private String dst_ip;
	private String dst_port;

	public ArticleContent(int article_no, String content, String src_ip, String dst_ip, String dst_port) {
		this.article_no = article_no;
		this.content = content;
		this.src_ip = src_ip;
		this.dst_ip = dst_ip;
		this.dst_port = dst_port;
	}

	public int getArticle_no() {
		return article_no;
	}

	public void setArticle_no(int article_no) {
		this.article_no = article_no;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getSrc_ip() {
		return src_ip;
	}

	public void setSrc_ip(String src_ip) {
		this.src_ip = src_ip;
	}

	public String getDst_ip() {
		return dst_ip;
	}

	public void setDst_ip(String dst_ip) {
		this.dst_ip = dst_ip;
	}

	public String getDst_port() {
		return dst_port;
	}

	public void setDst_port(String dst_port) {
		this.dst_port = dst_port;
	}

	
}
