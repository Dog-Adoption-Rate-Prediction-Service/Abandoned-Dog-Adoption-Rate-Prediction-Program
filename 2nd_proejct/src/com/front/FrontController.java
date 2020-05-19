package com.front;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.AdoptCon;
import com.controller.AgencyCon;
import com.controller.DeveloperCon;
import com.controller.InfoCon;
import com.controller.LoginCon;
import com.controller.LogoutCon;
import com.controller.MainAdoptCon;
import com.controller.MainNoticeCon;
import com.controller.NoticeBoardCon;
import com.controller.NoticeCon;
import com.controller.AdoptPreCon;
import com.controller.StatusCon;
import com.controller.SupportCon;
import com.controller.WriteNoticeCon;

/**
 * Servlet implementation class AccessLinkService
 */
@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String URI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = URI.substring(contextPath.length());

		String moveURL = "";

		Command com = null;

		if (command.equals("/Info.do")) {
			com = new InfoCon();
		} else if (command.equals("/Status.do")) {
			com = new StatusCon();
		} else if (command.equals("/Adopt.do")) {
			com = new AdoptCon();
		} else if (command.equals("/Agency.do")) {
			com = new AgencyCon();
		} else if (command.equals("/Developer.do")) {
			com = new DeveloperCon();
		} else if (command.equals("/Login.do")) {
			com = new LoginCon();
		} else if (command.equals("/Logout.do")) {
			com = new LogoutCon();
		} else if (command.equals("/WriteNotice.do")) {
			com = new WriteNoticeCon();
		} else if (command.equals("/Notice.do")) {
			com = new NoticeCon();
		} else if (command.equals("/NoticeBoard.do")) {
			com = new NoticeBoardCon();
		} else if (command.equals("/MainNotice.do")) {
			com = new MainNoticeCon();
		} else if (command.equals("/Support.do")) {
			com = new SupportCon();
		} else if (command.equals("/MainAdopt.do")) {
			com = new MainAdoptCon();
		} else if (command.equals("/AdoptPre.do")) {
			com = new AdoptPreCon();
		}

		moveURL = com.execute(request, response);
		response.sendRedirect(moveURL);

	}

}
