package com.playground.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.playground.dao.ProjectDao;

public class ProjectDeleteProcess implements CommandProcess {

	@Override
	public ForwardService requestProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String No = request.getParameter("no");
		String pass = request.getParameter("pass");
		String pageNum = request.getParameter("pageNum");
		String type = request.getParameter("type");
		String keyword = request.getParameter("keyword");
		
		/*
		if(No == null || No.equals("") || pass == null || pass.equals("")
			|| pageNum == null || pageNum.equals("")) {

		
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("	alert('정상적인 접근이 아닙니다.');");
			out.println("	history.back();");
			out.println("</script>");
			return null;
		}*/
		
		ProjectDao dao = ProjectDao.getInstance();
		int no = Integer.parseInt(No);
		boolean isPassCheck = dao.isPassCheck(no, pass);
		
		if(! isPassCheck) {
				
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("	alert('비밀번호가 맞지 않습니다.');");
			out.println("	history.back();");
			out.println("</script>");
			return null;
		}
		
		
		dao.deleteProject(no);	
		
	
		boolean searchOption = (type == null || type.equals("") 
				|| keyword == null || keyword.equals("")) ? false : true; 	
		
		
		String url = "projectList.mvc?pageNum=" + pageNum;

		if(searchOption) {
			
	
			keyword = URLEncoder.encode(keyword, "utf-8");
			
			url += "&type=" + type + "&keyword=" + keyword; 
		}


		ForwardService forward = new ForwardService();
		forward.setRedirect(false);
		forward.setPath(url);
		return forward;
	}

}
