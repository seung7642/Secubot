package com.secubot.noti.command;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import java.io.IOException;

import org.json.simple.JSONObject;
import com.secubot.noti.service.CheckMyNotiService;

@WebServlet("/checkMyNoti")
public class CheckMyNotiHandler extends HttpServlet {

	private CheckMyNotiService checkMyNotiService = new CheckMyNotiService();
	
	public void init() throws ServletException {
		
	}
	
	public void doGet(HttpServletRequest req, HttpServletResponse res) 
	throws ServletException, IOException {
		try {
			// 알림의 총 갯수를 받아온다.
			int notiCount = checkMyNotiService.check();
			JSONObject json = new JSONObject();
			json.put("notiCount", notiCount);
			res.setContentType("application/json");
			res.addHeader("Access-Control-Allow-Origin", "*");
			req.getSession().setAttribute("notiCount", notiCount);
			res.getWriter().println(json);
		} finally {
			// TODO: Nothing
		}
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse res)
	throws ServletException, IOException {
		
	}
}
