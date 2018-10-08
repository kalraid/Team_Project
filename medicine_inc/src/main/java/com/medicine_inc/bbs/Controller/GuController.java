package com.medicine_inc.bbs.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class GuController {
	@SuppressWarnings("unused")
	private final static String DEFAULT_PATH = "/resources/upload/";
	
	@RequestMapping(value= 
		{"/boardList","/boardList","/Boardlist","/Boardlist"})
	public String boardList(Model model){
	
	return "/Gukyung/boardList";
	}
	
	@RequestMapping(value= {"/notice","/Notice"})
	public String notice(Model model){
	
	return "/Gukyung/notice";
	}
	
	
}
