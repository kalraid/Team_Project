package com.playground.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.playground.beans.Recommend;
import com.playground.beans.RecommendReyply;

import com.playground.dao.RecommendDao;

public class RecommendDetailProcess implements CommandProcess {

	@Override
	public ForwardService requestProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	HttpSession session = request.getSession();

		
	/*	  boolean isLogin = session.getAttribute("isLogin") != null ? (Boolean)
		  session.getAttribute("isLogin") : false;
		  
		  if(! isLogin) {
		  
		  
		  response.setContentType("text/html; charset=utf-8"); PrintWriter out =
		  response.getWriter();
		  
		  out.println("<script>");
		  out.println("alert('회원 전용 서비스 입니다 \n회원 로그인을 해주세요');");
		  out.println("history.back();"); out.println("</script>");
		  
		  return null;
		  
		  }
		*/
		String no = request.getParameter("no");
		String pageNum = request.getParameter("pageNum");
		String type = request.getParameter("type");
		String keyword = request.getParameter("keyword");
		System.out.println("no : " + no +  " , " + pageNum);

		// no와 pageNum이 비어 있으면 비정상 요청임
	if (no == null || no.equals("") || pageNum == null || pageNum.equals("")) {

			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();

			out.println("<script>");
			out.println("	alert('잘못된 접근입니다.');");
			out.println("	history.back();");
			out.println("</script>");
			return null;
		}

		boolean searchOption = (type == null || type.equals("") || keyword == null || keyword.equals("")) ? false
				: true;

		RecommendDao dao = RecommendDao.getInstance();
		Recommend recommend = dao.getRecommend(Integer.valueOf(no));
		
		if(recommend.getFile() != null) {
			recommend.setFile(URLEncoder.encode(recommend.getFile(), "utf-8"));
			
		
		
		}
		
		ArrayList<RecommendReyply> recommendreplyList = dao.getReplyList(Integer.valueOf(no));

		request.setAttribute("recommend", recommend);
		request.setAttribute("recommendreplyList", recommendreplyList);
		request.setAttribute("no", no);
		System.out.println("no : " + no);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("type", type);
		request.setAttribute("keyword", keyword);

		
		System.out.println("recommend : " + recommend + recommendreplyList);
		 
		if (searchOption) {
			keyword = URLEncoder.encode(keyword, "utf-8");
			request.setAttribute("word", keyword);
			request.setAttribute("type", type);
			request.setAttribute("keyword", keyword);

		}

		ForwardService forward = new ForwardService();

		
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/index.jsp?body=board/recommendDetail.jsp");

		return forward;

	}

}
