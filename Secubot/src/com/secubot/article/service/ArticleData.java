package com.secubot.article.service;

import com.secubot.article.model.Article;
import com.secubot.article.model.ArticleContent;

public class ArticleData {

	private Article article;
	//private ArticleContent content;

	public ArticleData(Article article) {
		this.article = article;
		//this.content = content;
	}

	public Article getArticle() {
		return article;
	}

	//public String getContent() {
	//	return content.getContent();
	//}

}
