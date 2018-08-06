package com.playground.ajax;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.playground.beans.Place;

public class DelPlaceList implements AjaxProcess {

	@Override
	public void ajaxProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		
		String no = request.getParameter("no");
		System.out.println(no);
		
		HttpSession session = request.getSession();
		ArrayList<Place> PList =  (ArrayList<Place>) session.getAttribute("PList");
		
		PList.remove(Integer.parseInt(no));
		session.setAttribute("PList", PList);
		
		
	}

}
