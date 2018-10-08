package com.medicine_inc.bbs.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AeController {
	@SuppressWarnings("unused")
	private final static String DEFAULT_PATH = "/resources/upload/";
	

	
	@RequestMapping(value= 
		{"/HealthSupport","/healthSupport","/Healthsupport","/healthsupport"})
	public String healthSupport(Model model){
	
	return "/Aehee/healthSupport";
	}
	
	
}
