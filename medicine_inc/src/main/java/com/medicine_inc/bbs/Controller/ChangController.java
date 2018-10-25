package com.medicine_inc.bbs.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChangController {
	@SuppressWarnings("unused")
	private final static String DEFAULT_PATH = "/resources/upload/";
	
	
	@RequestMapping(value= 
		{"/depressed","/Depressed"})
	public String depressed(Model model){
	
	return "/Changmyoung/depressed";
	}

	@RequestMapping(value= {"/login","/Login"})
	public String login(Model model){
	
	return "/Changmyoung/login";
	}

	@RequestMapping(value= {"/SignUp","/signUp","/Signup","/signup"})
	public String signUp(Model model){
	
	return "/Changmyoung/signUp";
	}
}
