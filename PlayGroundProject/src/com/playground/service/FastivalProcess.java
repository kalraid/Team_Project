package com.playground.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FastivalProcess implements CommandProcess {

	@Override
	public ForwardService requestProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		
		ForwardService forward = new ForwardService();
		forward.setPath("/WEB-INF/index.jsp?body=festival/festivalView.jsp");
		return forward;
	}

}
