package com.playground.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.playground.beans.ProjectReply;
import com.playground.dao.ProjectDao;

public class ProjectReplyWriteAction implements AjaxProcess {

	@Override
	public void ajaxProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String projectNo = request.getParameter("projectNo");
		String projectReply = request.getParameter("replyContent");
		String projectWriter = request.getParameter("projectWriter");
		if(projectWriter =="") {
			projectWriter = "정현용";
		}
		
		ProjectReply p = new ProjectReply();
		p.setProjectNo(Integer.parseInt(projectNo));
		p.setProjectreply(projectReply);
		p.setProjectwriter(projectWriter);
		
		ProjectDao dao = ProjectDao.getInstance();
		dao.addReply(p);
		
		ArrayList<ProjectReply> replyList = dao.getReplyList(Integer.parseInt(projectNo));
		Gson gson = new Gson();
		
		
		String result = gson.toJson(replyList);
		System.out.println("ReplyWriteAction - result : " + result);
		
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(result);
		
		
		

	}

}
