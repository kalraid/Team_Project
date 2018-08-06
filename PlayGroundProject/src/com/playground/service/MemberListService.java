package com.playground.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.playground.beans.Member;
import com.playground.dao.MemberDao;
import com.playground.service.ForwardService;


public class MemberListService implements CommandProcess {

	private static final int PAGE_SIZE = 10;
	private static final int PAGE_GROUP = 10;
	@Override
	public ForwardService requestProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		boolean isLogin = session.getAttribute("isLogIn") != null ? 
				(Boolean) session.getAttribute("isLogIn") : false;

		if(! isLogin) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			
			out.println("<script>");
			out.println("	alert('회원 전용 서비스입니다.\\n회원 로그인을 해주세요');");
			out.println("	history.back();");
			out.println("</script>");
			return null;
		}
		String pageNum = request.getParameter("pageNum");
		String type = request.getParameter("type");	
		String keyword = request.getParameter("keyword");
		if(pageNum == null) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int startRow = currentPage * PAGE_SIZE - (PAGE_SIZE - 1);
		int endRow = startRow + PAGE_SIZE - 1;
		
		int listCount = 0;
		ArrayList<Member> memberList = null;
		
		MemberDao dao = MemberDao.getInstance();
		
		boolean searchOption = (type == null || type.equals("") 
				|| keyword == null || keyword.equals("")) ? false : true;
		if(!searchOption) {
			listCount = dao.getMemberCount();
		}else {
			listCount = dao.getMemberCount(type, keyword);
		}
		if(listCount > 0) {
			if(! searchOption) {
				memberList = dao.memberList(startRow, endRow);
			}else {
				memberList = dao.membersearchList(type, keyword, startRow, endRow);
			}
		}
		int pageCount = listCount / PAGE_SIZE + (listCount % PAGE_SIZE == 0 ? 0 : 1);
		
		int startPage = (currentPage / PAGE_GROUP) * PAGE_GROUP + 1 - (currentPage % PAGE_GROUP == 0 ? PAGE_GROUP : 0);
		
		int endPage = startPage + PAGE_GROUP - 1;
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("pageGroup", PAGE_GROUP);
		request.setAttribute("listCount", listCount);
		request.setAttribute("memberList", memberList);
		request.setAttribute("searchOption", searchOption);
		
		if(searchOption) {
			request.setAttribute("word", keyword);
			try {				
				keyword = URLEncoder.encode(keyword, "utf-8");
			} catch (UnsupportedEncodingException e) {				
				e.printStackTrace();
			}
			request.setAttribute("type", type);			
			request.setAttribute("keyword", keyword);
		}
		
		ForwardService forward = new ForwardService();	
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/index.jsp?body=member/memberList.jsp");
		return forward;
	}

}
