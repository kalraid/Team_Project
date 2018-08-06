package com.playground.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.playground.dao.MemberDao;

public class IdCheckService implements CommandProcess {

	@Override
	public ForwardService requestProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		MemberDao dao = MemberDao.getInstance();
		boolean check = dao.idCheck(id);
		request.setAttribute("id", id);
		request.setAttribute("check", check);
		
		ForwardService forward = new ForwardService();
		forward.setPath("/WEB-INF/member/idCheck.jsp");
		return forward;
	}

}
