package com.medicine_inc.bbs.Controller;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.SystemPropertyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.medicine_inc.bbs.domain.GuestReply;
import com.medicine_inc.bbs.domain.Pharmacy;
import com.medicine_inc.bbs.haejin.JinService;


@Controller
public class HaeController {
	@SuppressWarnings("unused")
	private final static String DEFAULT_PATH = "/resources/upload/";
	
	@Autowired
	private JinService service;
	
	public void setJinService(JinService service) {
		this.service = service;
	}	
	
	@RequestMapping(value= 
		{"/hospitalmaps","/Hospitalmaps","/Hospitalmaps"})
	public String hospitalMaps(Model model){
		
	return "/Haejin/hospitalMaps";
	}
	
	@RequestMapping(value= {"/news","/News"})
	public String news(Model model){
	
	return "/Haejin/layer";
	}
	
	@RequestMapping(value="/phDetail",  method = RequestMethod.GET)
	public String phDetail(Model model, String no, String tabactive, HttpServletRequest req) {
		List<Object> sList = new ArrayList<Object>();
		if(tabactive.equals("0")) {
			sList.add(service.getPharmacy(no));
		} else if(tabactive.equals("1")) {
			sList.add(service.getHospital(no));
		}
		//geolocation을 사용하여 현재위치 가져오기 => 근처 역으로 이동
		//클릭시 경로를 찾아주게 하기(버튼사용x) 폴리선
		//tabactive를 조건줘서 약국과 병원 조회
		int bbno = Integer.parseInt(no);
		int bbtype = Integer.parseInt(tabactive);
		List<GuestReply> greplyList = service.greplyList(bbno, bbtype);
		
		model.addAttribute("greplyList", greplyList);
		model.addAttribute("sList", sList);
		model.addAttribute("tabactive", tabactive);
		//System.out.println(sList);
		return "/Haejin/phDetail";
	}
	
	@RequestMapping(value= {"/phSearch"})
	public String phSearch(Model model, String area){
		//System.out.println(area);
		model.addAttribute("area", area);
	return "/Haejin/phSearch";
	}
	
	//layer test 경로탐색
	@RequestMapping("/layer")
	public String layer() {
		return "/Haejin/layer";
	}
	
	
}
