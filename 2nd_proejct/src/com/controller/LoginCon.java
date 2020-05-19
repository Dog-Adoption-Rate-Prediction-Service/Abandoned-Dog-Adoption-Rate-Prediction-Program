package com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.front.Command;
import com.model.AdminDAO;
import com.model.AdminDTO;

public class LoginCon implements Command {
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String moveURL = null;

		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		AdminDTO dto = new AdminDTO(id, pw);
		AdminDAO dao = new AdminDAO();

		AdminDTO user = dao.login(dto);
		if (user != null) {
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
			session.setAttribute("id", id);
			moveURL = "main.jsp";
		} else {
			moveURL = "login.jsp";
		}

		return moveURL;
	}
}