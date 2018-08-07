package com.playground.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.playground.beans.Project;
import com.playground.beans.ProjectReply;
import com.playground.dao.ProjectDao;

public class ProjectDetailProcess implements CommandProcess {

	@Override
	public ForwardService requestProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
/*
		
		  boolean isLogin = session.getAttribute("isLogin") != null ? (Boolean)
		  session.getAttribute("isLogin") : false;
		  
		  if(! isLogin) {
		  
		  
		  response.setContentType("text/html; charset=utf-8"); PrintWriter out =
		  response.getWriter();
		  
		  out.println("<script>");
		  out.println("alert('회원 전용 서비스 입니다 \n회원 로그인을 해주세요');");
		  out.println("history.back();"); out.println("</script>");
		  
		  return null;
		  
		  }*/
		 
		String no = request.getParameter("no");
		String pageNum = request.getParameter("pageNum");
		String type = request.getParameter("type");
		String keyword = request.getParameter("keyword");
		System.out.println("no : " + no +  " , " + pageNum);

		// no와 pageNum이 비어 있으면 비정상 요청임
/*	if (no == null || no.equals("") || pageNum == null || pageNum.equals("")) {

			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();

			out.println("<script>");
			out.println("	alert('잘못된 접근입니다.');");
			out.println("	history.back();");
			out.println("</script>");
			return null;
		}*/

		boolean searchOption = (type == null || type.equals("") || keyword == null || keyword.equals("")) ? false
				: true;

		ProjectDao dao = ProjectDao.getInstance();
		Project project = dao.getproject(Integer.valueOf(no));

		ArrayList<ProjectReply> projectreplyList = dao.getReplyList(Integer.valueOf(no));

		request.setAttribute("project", project);
		request.setAttribute("projectreplyList", projectreplyList);
		request.setAttribute("no", no);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("type", type);
		request.setAttribute("keyword", keyword);

		if (searchOption) {
			keyword = URLEncoder.encode(keyword, "utf-8");
			request.setAttribute("word", keyword);
			request.setAttribute("type", type);
			request.setAttribute("keyword", keyword);

		}

		ForwardService forward = new ForwardService();

		System.out.println("들어온다");
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/index.jsp?body=board/projectDetail.jsp");

		return forward;

	}

}
