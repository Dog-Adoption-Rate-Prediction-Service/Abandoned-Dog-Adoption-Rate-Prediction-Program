package com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.front.Command;

public class DeveloperCon implements Command{
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String moveURL = null;
		
		moveURL = "developer.jsp";
		
		return moveURL;
	}
}
