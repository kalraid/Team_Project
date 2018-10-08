package com.medicine_inc.bbs.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HaeController {
	@SuppressWarnings("unused")
	private final static String DEFAULT_PATH = "/resources/upload/";
	

	
	@RequestMapping(value= 
		{"/hospitalMaps","/hospitalmaps","/Hospitalmaps","/Hospitalmaps"})
	public String hospitalMaps(Model model){
	
	return "/Haejin/hospitalMaps";
	}
	
	@RequestMapping(value= {"/news","/News"})
	public String news(Model model){
	
	return "/Haejin/news";
	}
	
	
}
