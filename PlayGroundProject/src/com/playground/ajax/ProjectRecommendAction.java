package com.playground.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.playground.dao.ProjectDao;

public class ProjectRecommendAction implements AjaxProcess {

	@Override
	public void ajaxProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			
		String no = request.getParameter("no");
		
		ArrayList<Integer>re;
		ProjectDao dao = ProjectDao.getInstance();
		re = dao.getRecommend(Integer.parseInt(no));
		System.out.println(re);
		Gson gson = new Gson();
		
		String result = gson.toJson(re);
		System.out.println("RecommendAction - result : " + result);
		System.out.println(result);
		
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(result);
		
		
		
	}

}
