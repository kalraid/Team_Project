package com.playground.ajax;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RecommendGetThemaPlace implements AjaxProcess {

	@Override
	public void ajaxProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 소테마 클릭시 요기로 와서 dao로 가서 장소내용 긁어오고 < - 가져올떄부터 위도 경도 주변으로 가져와야함 
		// list로 받은다음에 리스트를 페이지로 넘겨주기
		
		// 페이지에서 
		
	}

}
