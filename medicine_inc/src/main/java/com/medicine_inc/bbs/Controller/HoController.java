package com.medicine_inc.bbs.Controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.medicine_inc.bbs.chanho.IllDaoService;

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
	public String ill(Model model,
			@RequestParam(value="pageNum", required=false, defaultValue="1") int pageNum,
			@RequestParam(value="keyword", required=false, defaultValue="") String keyword){
		Map<String, Object> modelMap = illDaoService.IllList(pageNum, keyword);
		
		
		model.addAttribute("iList", modelMap.get("IllList"));
		model.addAllAttributes(modelMap);	
		
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
