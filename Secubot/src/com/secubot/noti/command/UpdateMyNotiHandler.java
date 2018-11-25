package com.secubot.noti.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.secubot.noti.service.UpdateMyNotiService;
import com.secubot.noti.service.ReadMyNotiService;
import com.secubot.auth.service.User;
import com.secubot.mvc.command.CommandHandler;

public class UpdateMyNotiHandler implements CommandHandler {

	private UpdateMyNotiService updateNotiService = new UpdateMyNotiService();
	private ReadMyNotiService readNotiService = new ReadMyNotiService();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		User authUser = (User)req.getSession().getAttribute("authUser");
		
		String noti_no = req.getParameter("noti_no");
		int notiNo = Integer.parseInt(noti_no);
		
		updateNotiService.update(notiNo);
		
		boolean notiCheck = readNotiService.isNotiCheck(authUser.getId());
		req.getSession().setAttribute("notiCheck", notiCheck);
		
		return null;
	}
}
