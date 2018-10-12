package com.medicine_inc.bbs.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.medicine_inc.bbs.chanho.IllDaoService;
import com.medicine_inc.bbs.domain.IllList;

@Controller
public class HoController {
	@SuppressWarnings("unused")
	private final static String DEFAULT_PATH = "/resources/upload/";
	
	
	@Autowired
	private IllDaoService illDaoService;
	
	public void setIllDaoService(IllDaoService illDaoService) {
		this.illDaoService=illDaoService;
	}
	
	
	
	@RequestMapping(value= {"/sitemap", "/Sitemap"})
	public String sitemap(Model model){
		
		
		return "/Chanho/sitemap";
		}
	
	@RequestMapping(value= {"/ill", "/Ill"})
	public String ill(Model model){
		List<IllList> illist = illDaoService.IllList();
		System.out.println(illist+",  "+illist.size()+",  "+illist.toString());
		
		
		model.addAttribute("iList", illist);
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
