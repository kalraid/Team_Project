package com.playground.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.playground.dao.MemberDao;

public class PassCheckService implements CommandProcess {

	@Override
	public ForwardService requestProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		MemberDao dao = MemberDao.getInstance();
		boolean check = dao.passCheck(id, pass);
		request.setAttribute("oldpass", pass);
		request.setAttribute("check", check);
		
		ForwardService forward = new ForwardService();
		forward.setPath("/WEB-INF/member/passCheck.jsp");
		return forward;
	}

}
