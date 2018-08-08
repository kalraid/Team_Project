package com.playground.ajax;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.playground.beans.Place;

public class AddPlaceList implements AjaxProcess {

	@Override
	public void ajaxProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String name = request.getParameter("name");
		String address = request.getParameter("address");
		double lat = Double.parseDouble(request.getParameter("lat"));
		double lng = Double.parseDouble(request.getParameter("lng"));
		String img = request.getParameter("img");
		Place p = new Place();
		p.setName(name);
		p.setAddress(address);
		p.setImg(img);
		p.setLatitude(lat);
		p.setLongitude(lng);
		HttpSession session = request.getSession();

		ArrayList<Place> PList = (ArrayList<Place>) session.getAttribute("PList");
		int count = 0;
		int size = PList.size();
		
		if (size == 0) {
			PList.add(p);
		} else {
			for (int i = 0; i < size; i++) {
				if (PList.get(i).getName().equals(p.getName())) {
					count+=1;
				}
			}
			if(count==0) {
				PList.add(p);
			}
		}
		session.setAttribute("PSize", size);
		session.setAttribute("PList", PList);
	
	}

}
