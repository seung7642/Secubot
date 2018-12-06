package com.secubot.noti.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.secubot.noti.service.UpdateMyNotiService;
import com.secubot.noti.service.ReadMyNotiService;
import com.secubot.auth.service.User;
import com.secubot.mvc.command.CommandHandler;

public class UpdateMyNotiHandler implements CommandHandler {

	private UpdateMyNotiService updateNotiService = new UpdateMyNotiService();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO: 게시글을 읽으면 해당 게시글과 같은 article_no를 가진 mynoti 레코드의 read_check 값을 'true'로 수정한다.
		
		return null;
	}
}
