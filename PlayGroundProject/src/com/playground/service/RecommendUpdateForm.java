package com.playground.service;
/*package service;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Recommend;
import dao.RecommendDao;

public class RecommendUpdateForm implements CommandProcess {

	@Override
	public ForwardService requestProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		
		// 번호 제목 아이디 작성자 날짜 조회수 게시물 내용
		
		String rNo = request.getParameter("no");
		System.out.println("rNo : " + rNo);
		int no = Integer.parseInt(rNo);
		String rPass = request.getParameter("rPass");
		String pageNum = request.getParameter("pageNum");
		
		Project p = new Project();
		ProjectDao dao = ProjectDao.getInstance();
		
		p = dao.getproject(no);
		
		
		
		ForwardService forward = new ForwardService();
		
		request.setAttribute("p", p);
		request.setAttribute("pageNum", pageNum);
		
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/index.jsp?body=board/recommendUpdate.jsp");
		
		return forward;
	}

}
*/