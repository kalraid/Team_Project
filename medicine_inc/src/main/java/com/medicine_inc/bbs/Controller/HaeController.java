package com.medicine_inc.bbs.Controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.medicine_inc.bbs.domain.Pharmacy;
import com.medicine_inc.bbs.haejin.JinService;

@Controller
public class HaeController {
	@SuppressWarnings("unused")
	private final static String DEFAULT_PATH = "/resources/upload/";
	
	@Autowired
	private JinService jinService;
	
	public void setJinService(JinService jinService) {
		this.jinService = jinService;
	}
	
	@RequestMapping(value="/radiansList", method=RequestMethod.POST)
	public String radiansList(Model model, String lat, String lng) {
		System.out.println(lat+","+lng);
		List<Pharmacy> pList = jinService.radiansList(lat, lng);
				
		return "";
	}
	
	
	
	
	@RequestMapping(value= 
		{"/hospitalmaps","/Hospitalmaps","/Hospitalmaps"})
	public String hospitalMaps(Model model){
	
	return "/Haejin/hospitalMaps";
	}
	
	@RequestMapping(value= {"/news","/News"})
	public String news(Model model){
	
	return "/Haejin/news";
	}
	
	@RequestMapping(value= {"test01"})
	public String test(Model model) {
		return "/Haejin/test01";
	}
	
	
}
