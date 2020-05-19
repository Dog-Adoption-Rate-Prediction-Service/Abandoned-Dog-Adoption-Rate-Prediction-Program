package com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.front.Command;
import com.model.UserDAO;

public class MainNoticeCon implements Command {
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String moveURL = null;
		UserDAO dao = new UserDAO();
		int num = 1;
		int len = 9;
		HttpSession session = request.getSession();

		session.setAttribute("noticeAllNum", dao.CountNotice());
		session.setAttribute("noticeList", dao.LoadNotice(num,len));

		moveURL = "mainNotice.jsp?num=1";

		return moveURL;
	}
}