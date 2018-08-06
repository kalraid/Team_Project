package com.playground.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.playground.beans.themaPlace;
import com.playground.dao.PlaceDao;

public class getMarkerMap implements AjaxProcess {

	@Override
	public void ajaxProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		double lat = Double.parseDouble(request.getParameter("lat"));
		double lng = Double.parseDouble(request.getParameter("lng"));
		int no = Integer.parseInt(request.getParameter("no"));
		PlaceDao dao = new PlaceDao();
		ArrayList<themaPlace> tList = dao.getThemaPlace(no, lat, lng);
		Gson gson = new Gson();
		String result = gson.toJson(tList);
		response.setContentType("text/html; charset=utf-8");		
		PrintWriter out = response.getWriter();
		out.println(result);
	}

}
