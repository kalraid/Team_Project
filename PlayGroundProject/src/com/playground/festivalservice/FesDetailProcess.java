package com.playground.festivalservice;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.playground.dao.FestivalDao;
import com.playground.service.CommandProcess;
import com.playground.service.ForwardService;
import com.playground.vo.AreaCode;
import com.playground.vo.Festival;
import com.playground.vo.FestivalInfo;

public class FesDetailProcess implements CommandProcess {

	@Override
	public ForwardService requestProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

//nav바
		AreaDistrictgetMethod method = new AreaDistrictgetMethod();
		ArrayList<AreaCode> areaList = new ArrayList<AreaCode>();
		ArrayList<Festival> fList = new ArrayList<Festival>();
		ArrayList<String> array1 = new ArrayList<String>();
		ArrayList<String> array2 = new ArrayList<String>();
		ArrayList<String> array3 = new ArrayList<String>();
		
		areaList = method.getAreaCode(); //지역 이름, 코드
		fList = method.getSumArea(); //sumArea, 지역코드
		String str = "";
		for(int i=0;i<fList.size();i++){ 
			
			if(fList.get(i).getAreaCode() == 1){
				str = fList.get(i).getSumArea();
				array1.add(str);
			} else if(fList.get(i).getAreaCode() == 31){
				str = fList.get(i).getSumArea();
				array2.add(str);
			} else if(fList.get(i).getAreaCode() == 32){
				str = fList.get(i).getSumArea();
				array3.add(str);
			}
		}
		
		request.setAttribute("areaList", areaList);
		request.setAttribute("array1", array1);
		request.setAttribute("array2", array2);
		request.setAttribute("array3", array3);
		//nav 바 끝
				
				
		
		String title = request.getParameter("title");

		
		int contentId = Integer.parseInt(request.getParameter("contentId"));
		String pageNum = request.getParameter("pageNum");
		
		FestivalDao dao = FestivalDao.getInstance();
		FestivalInfo f = dao.getFestivalInfo(contentId);
		
		
		String xmap = request.getParameter("xmap");
		String ymap = request.getParameter("ymap");
		
		
		request.setAttribute("xmap", xmap);
		request.setAttribute("ymap", ymap);
		request.setAttribute("contentId", contentId);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("f", f);
		request.setAttribute("title", title);
		
		ForwardService forward = new ForwardService();
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/index.jsp?body=festival/festivalPage.jsp?home=festivalDetailView.jsp");
		return forward;
	}

}
