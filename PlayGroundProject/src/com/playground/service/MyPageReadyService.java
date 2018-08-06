package com.playground.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.playground.beans.Member;
import com.playground.dao.MemberDao;

public class MyPageReadyService implements CommandProcess {

	@Override
	public ForwardService requestProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		MemberDao dao = MemberDao.getInstance();
		Member m = dao.getMember(id);
		session.setAttribute("m", m);
		
		ForwardService forward = new ForwardService();
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/index.jsp?body=member/myPage.jsp");
		return forward;
	}

}
