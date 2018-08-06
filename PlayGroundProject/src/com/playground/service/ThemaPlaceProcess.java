package com.playground.service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.playground.beans.thema;
import com.playground.beans.themaPlace;
import com.playground.dao.PlaceDao;

public class ThemaPlaceProcess implements CommandProcess {

	@Override
	public ForwardService requestProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String num = request.getParameter("num");
		String thema = request.getParameter("thema");
		System.out.println("thema : "+thema);
		
		PlaceDao dao = new PlaceDao();
		
		ArrayList<thema> themaList = new ArrayList<thema>();
		ArrayList<themaPlace> themaPlaceList = new ArrayList<themaPlace> ();
		themaList = dao.getThema(Integer.parseInt(thema));
		if(num != ""&&num!=null) {
		themaPlaceList = dao.getThemaPlace(Integer.parseInt(num)); 
		
			
			
		}
		
		int ListCount = themaList.size();
		request.setAttribute("themaPlaceList", themaPlaceList);
		request.setAttribute("themaList", themaList);
		request.setAttribute("ListCount", ListCount);
		
		ForwardService forward = new ForwardService();
		
		forward.setPath("/WEB-INF/index.jsp?body=pages/themaPlace.jsp");
		return forward;
		
	}

}
