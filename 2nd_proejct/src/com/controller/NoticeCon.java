package com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.front.Command;
import com.model.UserDAO;

public class NoticeCon implements Command {
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String moveURL = null;
		UserDAO dao = new UserDAO();
		int num = 1;
		HttpSession session = request.getSession();
		if (request.getParameter("num") != null) {
			num = Integer.parseInt(request.getParameter("num"));
		}
		session.setAttribute("noticeAllNum", dao.CountNotice());
		session.setAttribute("noticeList", dao.LoadNotice(num));

		moveURL = "notice.jsp?num=" + num;

		return moveURL;
	}
}