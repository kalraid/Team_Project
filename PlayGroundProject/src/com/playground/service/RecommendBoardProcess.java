package com.playground.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RecommendBoardProcess implements CommandProcess {

	@Override
	public ForwardService requestProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		
		ForwardService forward = new ForwardService();
		forward.setPath("/WEB-INF/index.jsp?body=board/recommendBoard.jsp");
		return forward;
	}

}
