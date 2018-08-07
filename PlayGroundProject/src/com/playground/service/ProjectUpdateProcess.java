package com.playground.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.playground.beans.Project;
import com.playground.dao.ProjectDao;

public class ProjectUpdateProcess implements CommandProcess {

	@Override
	public ForwardService requestProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String contentType = request.getHeader("Content-Type");
		System.out.println("contentType : " + contentType);	
		ProjectDao dao = ProjectDao.getInstance();
		Project Project = null;
		String  pass= null, linklist = null, people = null, good = null, id = null,
				gesimul = null , sNo = null, pageNum = null, type=null, keyword=null
				;
		int no = 0;		
		
			request.setCharacterEncoding("utf-8");
			sNo = request.getParameter("no");		
			System.out.println("sNo : " + sNo);
			pass = request.getParameter("pass");
			System.out.println("pass : " + pass);
			pageNum = request.getParameter("pageNum");
			System.out.println("pageNum : " + pageNum);
			type = request.getParameter("type");
			System.out.println("type : " + type);
			keyword = request.getParameter("keyword");
			gesimul = request.getParameter("gesimul");
			linklist = request.getParameter("linklist");
			System.out.println("keyword : " + keyword);
			
			no = Integer.parseInt(sNo);
			
			boolean isPassCheck = dao.isPassCheck(no, pass);
			if(! isPassCheck) {
				System.out.println("비밀번호 맞지 않음");
				
				response.setContentType("text/html; charset=utf-8");
				PrintWriter out = response.getWriter();				
				StringBuilder sb = new StringBuilder();
				sb.append("<script>");
				sb.append("	alert('비밀번호가 맞지 않습니다.');");
				sb.append("	history.back();");
				sb.append("</script>");
				out.println(sb.toString());
				return null;
			} 
			linklist = request.getParameter("linklist");
			people = request.getParameter("people");		
			good = request.getParameter("good");
			
			Project = new Project();
			
			Project.setNo(no);
			Project.setLinklist(linklist);
			Project.setId(id);
			Project.setPass(pass);
			Project.setPeople(people);
			Project.setGood(good);
			Project.setGesimul(gesimul);
			
		dao.UpdateProject(Project);
	
		boolean searchOption = (type == null || type.equals("") 
				|| keyword == null || keyword.equals("")) ? false : true; 	
		
		String url = "projectList.mvc?pageNum=" + pageNum;
		
		if(searchOption) {
		
			keyword = URLEncoder.encode(keyword, "utf-8");
			
			url += "&type=" + type + "&keyword=" + keyword; 
		}		

	
		ForwardService forward = new ForwardService();
		forward.setRedirect(true);
		forward.setPath(url);
		return forward;
		
	}

}
