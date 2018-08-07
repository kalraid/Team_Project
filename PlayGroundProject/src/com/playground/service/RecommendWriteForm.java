package com.playground.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.playground.dao.RecommendDao;

public class RecommendWriteForm implements CommandProcess {

	@Override
	public ForwardService requestProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		String id = request.getParameter("id");
//		String linklist = request.getParameter("linklist");
//		String gesimul = request.getParameter("gesimul");
//		String people = request.getParameter("people");
		
		
		
		ForwardService forward = new ForwardService();
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/index.jsp?body=board/recommendWrite.jsp");
		return forward;
	}

}
