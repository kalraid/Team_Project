package com.playground.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.playground.dao.MemberDao;

public class MemberDeleteProcessService implements CommandProcess {

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
		String pass = request.getParameter("pass");
		String id = request.getParameter("id");
		System.out.println("deleteservice pass : " +pass);
		System.out.println("deleteservice id : " +id);
		boolean passCheck = false;
		MemberDao dao = MemberDao.getInstance();
		passCheck = dao.passCheck(id, pass);
		if(!passCheck) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println(" alert('비밀번호가 일치하지 않습니다');");
			out.println(" history.back()");
			out.println("</script>");
			return null;
		}
		dao.memberDelete(passCheck, id);
		session.invalidate();
		ForwardService forward = new ForwardService();
		forward.setRedirect(true);
		forward.setPath("index.mvc");
		return forward;
	}

}
