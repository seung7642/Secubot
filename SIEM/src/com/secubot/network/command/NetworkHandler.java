package com.secubot.network.command;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.secubot.network.service.NetworkServiceModel;
import com.secubot.network.model.NetworkModel;
import com.secubot.network.service.NetworkService;

@WebServlet("/network")
public class NetworkHandler extends HttpServlet {

	private NetworkService networkService = null;
	
	public void init() throws ServletException {
		
	}
	
	public void doGET(HttpServletRequest req, HttpServletResponse res)
	throws ServletException, IOException {
		networkService = new NetworkService();
		NetworkServiceModel networkServiceModel = new NetworkServiceModel();
		networkServiceModel = networkService.getNetworkModelList();
		
		req.setAttribute("networkServiceModel", networkServiceModel);
	}
	
	public void doPOST(HttpServletRequest req, HttpServletResponse res)
	throws ServletException, IOException {
		
	}
}
