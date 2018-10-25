package com.medicine_inc.bbs.Controller;

import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.medicine_inc.bbs.domain.Medi;
import com.medicine_inc.bbs.juhwa.MediService;

@Controller
public class JuController {
	@SuppressWarnings("unused")
	private final static String DEFAULT_PATH = "/resources/upload/";
	
	@Autowired
	private MediService mediService;
	
	public void setMediService(MediService mediService) {
		this.mediService = mediService;
	}
	
	
	@RequestMapping(value = {"/mediList","/list"})
	public String medi(Model model, 
			@RequestParam(value="pageNum", required=false, defaultValue="1") int pageNum,
			@RequestParam(value="mediCode", required=false, defaultValue="null") String mediCode,
			@RequestParam(value="mediEff", required=false, defaultValue="null") String mediEff,
			@RequestParam(value="mediName", required=false, defaultValue="null") String mediName,
			@RequestParam(value="mediMaker", required=false, defaultValue="null") String mediMaker) {
		
		System.out.println(mediCode);
		
		Map<String, Object> modelMap = mediService.mediList(pageNum, mediCode, mediName, mediEff, mediMaker);
		
		model.addAllAttributes(modelMap);
		
		return "/Juhwa/medicineSearch";
	}
	
	@RequestMapping(value = {"/search"})
	public String searchMedi() {
		
		return "/Juhwa/mediSearch";
	}
	
	@RequestMapping("/mediDetail") 
	public String MediDetail(Model model, int no,
			@RequestParam(value="pageNum", required=false, defaultValue="1") int pageNum,
			@RequestParam(value="mediCode", required=false, defaultValue="null") String mediCode,
			@RequestParam(value="mediEff", required=false, defaultValue="null") String mediEff,
			@RequestParam(value="mediName", required=false, defaultValue="null") String mediName,
			@RequestParam(value="mediMaker", required=false, defaultValue="null") String mediMaker)throws Exception{
		
		boolean searchOption = (mediCode.equals("null") 
				|| mediEff.equals("null") || mediName.equals("null")||mediMaker.equals("null")) ? false : true; 		
		
		Medi medi =  mediService.getMedi(no);
		
		model.addAttribute("medi", medi); 
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("searchOption", searchOption);
		
		if(searchOption) {
			model.addAttribute("name", URLEncoder.encode(mediName, "utf-8"));
			model.addAttribute("eff", URLEncoder.encode(mediEff, "utf-8"));
			model.addAttribute("maker", URLEncoder.encode(mediMaker, "utf-8"));
			
			model.addAttribute("mediCode", mediCode);
			model.addAttribute("mediName", mediName);
			model.addAttribute("mediEff", mediEff);
			model.addAttribute("mediMaker", mediMaker);
			
		}
		
		return "/Juhwa/mediDetail";

	}
}
