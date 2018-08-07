package com.playground.service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.playground.beans.Recommend;
import com.playground.dao.RecommendDao;

public class RecommendListService implements CommandProcess {

	final static int PAGE_COUNT = 10;
	
	@Override
	public ForwardService requestProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			/*int PAGE_COUNT = 10;*/
			String pageNum = request.getParameter("pageNum");
			String tab = request.getParameter("tab");
			String keyword = request.getParameter("keyword");
			
			if(pageNum == null) pageNum = "1";
			if(tab == null) tab = "all";
			if(keyword==null) keyword="";
			RecommendDao dao = RecommendDao.getInstance();
			
			int count = dao.getRecommendCount(tab, keyword);
			
			int page = count/PAGE_COUNT;
			
			if((count%PAGE_COUNT) > 0) page++;
			
			
			ArrayList<Recommend> RecommendList = dao.getRecommend(Integer.parseInt(pageNum), tab, keyword);
					
			request.setAttribute("pageNum",pageNum);
			request.setAttribute("tab", tab);
			request.setAttribute("keyword", keyword);
			request.setAttribute("page", page);
			request.setAttribute("RecommendList", RecommendList);
			
			ForwardService forward = new ForwardService();
			
			forward.setRedirect(false);
			forward.setPath("/WEB-INF/index.jsp?body=board/recommendList.jsp");
			
			
			return forward;
	}
}
