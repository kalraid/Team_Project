package com.playground.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.playground.beans.Place;

public class SearchPlaceList implements AjaxProcess {

	@Override
	public void ajaxProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

			
		HttpSession session = request.getSession();
		ArrayList<Place> PList= (ArrayList<Place>) session.getAttribute("PList");
		
		Gson gson = new Gson();
		String result = gson.toJson(PList);
		response.setContentType("text/html; charset=utf-8");		
		PrintWriter out = response.getWriter();
		out.println(result);
		
		
	}

}
