package com.playground.map;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.playground.service.CommandProcess;
import com.playground.service.ForwardService;

public class mapin implements CommandProcess {

	@Override
	public ForwardService requestProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ForwardService forward = new ForwardService();
		forward.setPath("/WEB-INF/index.jsp?body=dbInsertTools/form.html");
		return forward;
	}

}
