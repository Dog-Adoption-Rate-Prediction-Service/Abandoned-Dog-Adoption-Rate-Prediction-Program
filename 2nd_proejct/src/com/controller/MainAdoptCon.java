package com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.front.Command;
import com.model.UserDAO;

public class MainAdoptCon implements Command{
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String moveURL = null;
		UserDAO dao = new UserDAO();
		int num = 1;
		HttpSession session = request.getSession();
		session.setAttribute("adoptAllNum", dao.CountAdopt());
		session.setAttribute("adoptList", dao.LoadAdopt(num));
		
		moveURL = "mainAdopt.jsp?num=" + num;
		
		return moveURL;
	}
}