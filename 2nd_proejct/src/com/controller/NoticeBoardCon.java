package com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.front.Command;
import com.model.BoardDTO;
import com.model.UserDAO;

public class NoticeBoardCon implements Command{
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String moveURL = null;
		UserDAO dao = new UserDAO();
		BoardDTO dto = new BoardDTO();
		int num = Integer.parseInt(request.getParameter("num"));
		
		HttpSession session = request.getSession();
		
		dto = dao.SelectNotice(num);
		session.setAttribute("noticeBoard", dto);
		
		moveURL = "noticeBoard.jsp?num="+num;
		
		return moveURL;
	}
}
