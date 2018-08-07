package com.playground.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.playground.beans.Project;
import com.playground.dao.ProjectDao;

public class ProjectWriteProcess implements CommandProcess {

	@Override
	public ForwardService requestProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String people = request.getParameter("people");
		String linklist = request.getParameter("linklist");
		String gesimul = request.getParameter("gesimul");
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		
			
		ProjectDao dao = ProjectDao.getInstance();

		Project Project = new Project();

		Project.setLinklist(linklist);
		Project.setId(id);
		Project.setPeople(people);
		Project.setGesimul(gesimul);
		Project.setPass(pass);

		dao.insertproject(Project);

		ForwardService forward = new ForwardService();
		forward.setRedirect(false);
		forward.setPath("projectList.mvc");
		return forward;
	}

}
