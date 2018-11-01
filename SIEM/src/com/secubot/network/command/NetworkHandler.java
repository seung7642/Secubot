package com.secubot.network.command;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.secubot.network.service.NetworkServiceModel;
import com.secubot.network.model.NetworkModel;
import com.secubot.network.service.NetworkService;

@WebServlet("/network")
public class NetworkHandler extends HttpServlet {

	private NetworkService networkService = new NetworkService();
	private Gson gson = new Gson();
	private List<NetworkModel> networkList = new ArrayList<>();
	
	public void init() throws ServletException {
	}
	
	public void doGet(HttpServletRequest req, HttpServletResponse res)
	throws ServletException, IOException {
		networkList = networkService.getNetworkModelList();
		String listToJson = gson.toJson(networkList);
		
		res.setContentType("application/json");
		res.getWriter().write(listToJson);
		
		req.getSession().setAttribute("networkList", networkList);
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse res)
	throws ServletException, IOException {
	}
}
