package com.medicine_inc.bbs.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class KyungController {
	@SuppressWarnings("unused")
	private final static String DEFAULT_PATH = "/resources/upload/";

	
	@RequestMapping(value= 
		{"/FirstAid","/firstAid","/Firstaid","/firstaid"})
	public String firstAid(Model model){
	
	return "/Kyungmin/firstAid";
	}
	
	@RequestMapping(value= 
		{"/HealthScreening","/healthScreening","/Healthscreening","/healthscreening"})
	public String healthScreening(Model model){
	
	return "/Kyungmin/healthScreening";
	}

	@RequestMapping(value= {"/jiab","/Jiab"})
	public String jiab(Model model){
	
	return "/Kyungmin/jiab";
	}
	@RequestMapping(value= {"/quiz","/Quiz"})
	public String quiz(Model model){
	
	return "/Kyungmin/quiz";
	}
	@RequestMapping(value= {"/stretching","/Stretching"})
	public String stretching(Model model){
	
	return "/Kyungmin/stretching";
	}
	
	
}
