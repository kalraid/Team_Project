package com.playground.service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.playground.beans.Place;
import com.playground.beans.thema;
import com.playground.dao.MemberDao;
import com.playground.dao.PlaceDao;
import com.playground.map.mapAP;

public class PlaceRecommendPageProcess implements CommandProcess {

	public ForwardService requestProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PlaceDao dao = new PlaceDao();
		mapAP ma = new mapAP();
		MemberDao mdao = MemberDao.getInstance();
		boolean isLogin = false;
		HttpSession session = request.getSession();
		Boolean aCheck = false;
		if (session.getMaxInactiveInterval() != 30 * 60) {
			System.out.println("세션시간 : " + session.getMaxInactiveInterval());
			session.setMaxInactiveInterval(30 * 60);
		}
		ArrayList<Place> PList = (ArrayList<Place>) session.getAttribute("PList");
		int size = 0;
		if (session.getAttribute("PList") == null) {
			PList = new ArrayList<Place>();
			session.setAttribute("PList", PList);
			System.out.println("PList를 새로 생성했습니다");
		} else {
			size = PList.size();
		}
		;

		/*
		 * if (session.getAttribute("isLogIn") != null) { isLogin = (Boolean)
		 * session.getAttribute("isLogIn"); } if (!isLogin) {
		 * response.setContentType("text/html; charset=utf-8"); PrintWriter out =
		 * response.getWriter();
		 * 
		 * out.println("<script>");
		 * out.println("	alert('회원 전용 서비스입니다.\\n회원 로그인을 해주세요');");
		 * out.println("	history.back();"); out.println("</script>"); return null; }
		 */
		request.setAttribute("pSize", size);
		String id = (String) session.getAttribute("id");
		String admin = mdao.getAdmin(id);

		if (admin.equals("admin")) {
			aCheck = true;
			System.out.println("어드민 계정입니다.");
		}

		ArrayList<thema> tList = dao.getThemaN();

		/*
		 * Member m = mdao.getMember(id); ArrayList<Double> sList =
		 * ma.mapLngLat(m.getAddress()); System.out.println("주소 : "+m.getAddress());
		 */
		request.setAttribute("tList", tList);
		/*
		 * request.setAttribute("sList", sList); for (int i = 0; i < sList.size(); i++)
		 * { System.out.println(sList.get(i)); }
		 */
		System.out.println("pSize : " + size);
		request.setAttribute("aCheck", aCheck);
		ForwardService forward = new ForwardService();
		forward.setPath("/WEB-INF/index.jsp?body=pages/recommendpage.jsp");
		return forward;
	}
}
