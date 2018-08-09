package com.playground.service;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.playground.beans.Recommend;
import com.playground.dao.RecommendDao;

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
		
		Recommend p = new Recommend();
		RecommendDao dao = RecommendDao.getInstance();
		
		p = dao.getRecommend(no);
		
		request.setAttribute("p", p);
		request.setAttribute("pageNum", pageNum);
		
		ForwardService forward = new ForwardService();
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/index.jsp?body=board/recommendUpdate.jsp");
		
		return forward;
	}

}
