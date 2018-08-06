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

public class ReturnPlaceRecommend implements AjaxProcess {

	@Override
	public void ajaxProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		
		PlaceDao dao = new PlaceDao();
		ArrayList<thema> tList = dao.getThemaN();
		
		Gson gson = new Gson();
		String result = gson.toJson(tList);
		response.setContentType("text/html; charset=utf-8");		
		PrintWriter out = response.getWriter();
		out.println(result);
	}

}
