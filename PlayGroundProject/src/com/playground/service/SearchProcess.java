package com.playground.service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.playground.beans.themaPlace;
import com.playground.dao.PlaceDao;

public class SearchProcess implements CommandProcess {

	@Override
	public ForwardService requestProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String search = request.getParameter("search");
		System.out.println(search);
		
		PlaceDao dao = new PlaceDao();
		
		ArrayList<themaPlace> List = dao.searchPlace(search);
		request.setAttribute("List", List);
		
		
		ForwardService forward = new ForwardService();
		forward.setPath("/WEB-INF/index.jsp?body=pages/searchResult.jsp");
		return forward;
	}

}
