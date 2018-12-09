package com.secubot.report.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.secubot.report.service.ReportService;
import com.secubot.mvc.command.CommandHandler;

public class ReportHandler implements CommandHandler {

	private static final String FORM_VIEW = "/WEB-INF/aside/report/timeline.jsp";
	private ReportService reportService = new ReportService();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) {
		
	}
}
