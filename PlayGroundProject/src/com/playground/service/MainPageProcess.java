package com.playground.service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.playground.beans.Recommend;
import com.playground.dao.MainpageDao;

public class MainPageProcess implements CommandProcess {

	@Override
	public ForwardService requestProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		MainpageDao dao = new MainpageDao();
				ArrayList<Object> FestivalList = dao.getMainPageFestival();
				ArrayList<Recommend> RecommendList = dao.getMainRecommend();
		request.setAttribute("FList",FestivalList);
		request.setAttribute("RList", RecommendList);
		System.out.println(RecommendList.get(4).getFile());
		ForwardService forward = new ForwardService();
		forward.setPath("/WEB-INF/index.jsp?body=mainpage/mainpagebody.jsp");
		return forward;
	}

}
