package com.playground.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.playground.beans.Member;
import com.playground.dao.MemberDao;

public class MemberDetailService implements CommandProcess {

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
		String id = request.getParameter("id");
		String pageNum = request.getParameter("pageNum");
		String type = request.getParameter("type");	
		String keyword = request.getParameter("keyword");
		if(id == null || id.equals("") || pageNum == null || pageNum.equals("")) {

			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			
			out.println("<script>");
			out.println("	alert('정상적인 접근이 아닙니다.');");
			out.println("	history.back();");
			out.println("</script>");
			return null;
		}
		boolean searchOption = (type == null || type.equals("") || keyword == null || keyword.equals("")) ? false : true;
		
		MemberDao dao = MemberDao.getInstance();
		Member member = dao.getMember(id);
		
		request.setAttribute("member", member);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("searchOption", searchOption);
		if(searchOption) {
			request.setAttribute("keyword", keyword);
			try {
				keyword = URLEncoder.encode(keyword, "utf-8");
			}catch(UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			request.setAttribute("type", type);			
			request.setAttribute("keyword", keyword);
		}
		ForwardService forward = new ForwardService();
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/index.jsp?body=member/memberDetail.jsp");
		return forward;
	}

}
