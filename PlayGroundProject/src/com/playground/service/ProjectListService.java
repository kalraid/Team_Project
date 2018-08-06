package com.playground.service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.playground.beans.Project;
import com.playground.dao.ProjectDao;

public class ProjectListService implements CommandProcess {

	final static int PAGE_COUNT = 10;
	
	@Override
	public ForwardService requestProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*final static int PAGE_COUNT = 10;*/
			String pageNum = request.getParameter("pageNum");
			String tab = request.getParameter("tab");
			String keyword = request.getParameter("keyword");
			
			if(pageNum == null) pageNum = "1";
			if(tab == null) tab = "all";
			if(keyword==null) keyword="";
			ProjectDao dao = ProjectDao.getInstance();
			
			int count = dao.getProjectCount(tab, keyword);
			
			int page = count/PAGE_COUNT;
			
			if((count%PAGE_COUNT) > 0) page++;
			
			
			ArrayList<Project> Projectlist = dao.getProject(Integer.parseInt(pageNum), tab, keyword);
					
			request.setAttribute("pageNum",pageNum);
			request.setAttribute("tab", tab);
			request.setAttribute("keyword", keyword);
			request.setAttribute("page", page);
			request.setAttribute("Projectlist", Projectlist);
			
			ForwardService forward = new ForwardService();
			
			forward.setRedirect(false);
			forward.setPath("/WEB-INF/index.jsp?body=board/projectList.jsp");
			
			
			return forward;
	}
}
