package com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.front.Command;

public class LogoutCon implements Command {
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String moveURL = null;

		HttpSession session = request.getSession();
		session.removeAttribute("user");
		session.removeAttribute("id");
		session.invalidate();

		moveURL = "main.jsp";

		return moveURL;
	}
}