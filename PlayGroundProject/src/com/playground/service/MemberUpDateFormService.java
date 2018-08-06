package com.playground.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.playground.beans.Member;
import com.playground.dao.MemberDao;

public class MemberUpDateFormService implements CommandProcess {

	@Override
	public ForwardService requestProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		boolean isLogin = session.getAttribute("isLogIn") != null ? 
				(Boolean) session.getAttribute("isLogIn") : false;

		if(! isLogin) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			
			out.println("<script>");
			out.println("	alert('회원 전용 서비스입니다.\\n회원 로그인을 해주세요');");
			out.println("	history.back();");
			out.println("</script>");
			return null;
		}
		String id = (String)session.getAttribute("id");
		MemberDao dao = MemberDao.getInstance();
		Member m = dao.getMember(id);
		session.setAttribute("m", m);
		ForwardService forward = new ForwardService();
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/index.jsp?body=member/memberUpDateForm.jsp");
		return forward;
	}

}
