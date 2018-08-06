package com.playground.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.playground.dao.MemberDao;

public class MemberLogInService implements CommandProcess {

	@Override
	public ForwardService requestProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		String pass= request.getParameter("pass");
		String currentUrl = request.getParameter("currentUrl");
		
		MemberDao dao = MemberDao.getInstance();
		int logInCk = dao.memberlogin(id, pass);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if(logInCk == -1) {
			out.println("<script>");
			out.println(" alert('"+ id + "가 존재하지 않습니다');");
			out.println(" window.history.back();");
			out.println("</script>");
			return null;
		}else if(logInCk == 0) {
			out.println("<script>");
			out.println(" alert('비밀번호가 맞지 않습니다');");
			out.println(" window.history.back();");
			out.println("</script>");
			return null;
		}else if(logInCk == 1) {
			HttpSession session = request.getSession();
			session.setAttribute("id", id);
			session.setAttribute("isLogIn", true);
		}
		if(currentUrl == null) {
			currentUrl = "index.mvc";
		}
		System.out.println("currentUrl : " + currentUrl);
		
		ForwardService forward = new ForwardService();
		forward.setRedirect(true);
		forward.setPath(currentUrl);
		return forward;
	}

}
