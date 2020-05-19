package com.controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.front.Command;
import com.model.AdminDAO;

public class WriteNoticeCon implements Command {
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String moveURL = null;
		AdminDAO dao = new AdminDAO();
		
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		HttpSession session = request.getSession();
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		System.out.println("cont:" + content);
		String written = (String)session.getAttribute("id");
		dao.writeNotice(title, content, written);
		
		moveURL = "Notice.do?num=1";

		return moveURL;
	}
}