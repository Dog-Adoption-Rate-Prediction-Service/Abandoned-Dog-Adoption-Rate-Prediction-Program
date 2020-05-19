package com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.front.Command;


public class InfoCon implements Command{
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String moveURL = null;
		
		String btn = request.getParameter("btn");
		System.out.println(btn);
		moveURL = "info.jsp";
		
		return moveURL;
	}
}
