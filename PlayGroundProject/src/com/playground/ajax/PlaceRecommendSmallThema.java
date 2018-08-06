package com.playground.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.playground.beans.thema;
import com.playground.dao.PlaceDao;

public class PlaceRecommendSmallThema implements AjaxProcess {

	@Override
	public void ajaxProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		
		String str_num = request.getParameter("num");
		int num = Integer.parseInt(str_num);
		PlaceDao dao = new PlaceDao();
		
		ArrayList<thema> s_tList = dao.getThema(num);
		
		Gson gson = new Gson();
		String result = gson.toJson(s_tList);
		response.setContentType("text/html; charset=utf-8");		
		PrintWriter out = response.getWriter();
		out.println(result);
	}

}
