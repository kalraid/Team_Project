package com.medicine_inc.bbs.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HoController {
	@SuppressWarnings("unused")
	private final static String DEFAULT_PATH = "/resources/upload/";
	
	@RequestMapping(value= {"/sitemap", "/Sitemap"})
	public String sitemap(Model model){
		
		return "/Chanho/sitemap";
		}
	
	@RequestMapping(value= {"/ill", "/Ill"})
	public String ill(Model model){
		
		return "/Chanho/ill";
		}
	
	@RequestMapping(value= {"/food", "/Food"})
	public String food(Model model){
		
		return "/Chanho/food";
		}
	
	@RequestMapping(value= 
		{"/epidemicMaps", "/EpidemicMaps", "/epidemicmaps","/Epidemicmaps"})
	public String epidemicMaps(Model model){
		
		return "/Chanho/epidemicMaps";
		}
	
	
	@RequestMapping(value= {"/cheeting", "/Cheeting"})
	public String cheeting(Model model){
		
		return "/Chanho/cheeting";
		}
}
