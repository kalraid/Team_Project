package com.medicine_inc.bbs.Controller;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.medicine_inc.bbs.domain.Medi;
import com.medicine_inc.bbs.juhwa.MediService;
import com.medicine_inc.bbs.juhwa.Crawl;

@Controller
public class JuController {
	@SuppressWarnings("unused")
	private final static String DEFAULT_PATH = "/resources/upload/";
	
	@Autowired
	private MediService mediService;
	
	public void setMediService(MediService mediService) {
		this.mediService = mediService;
	}
	@Autowired
	private Crawl crawl;
	public void setCrawl(Crawl crawl) {
		this.crawl = crawl;
	}
	
	@RequestMapping(value = {"/mediList","/list"})
	public String medi(Model model, 
			@RequestParam(value="pageNum", required=false, defaultValue="1") int pageNum,
			@RequestParam(value="mediCode", required=false, defaultValue="null") String mediCode,
			@RequestParam(value="mediEff", required=false, defaultValue="null") String mediEff,
			@RequestParam(value="mediName", required=false, defaultValue="null") String mediName,
			@RequestParam(value="mediMaker", required=false, defaultValue="null") String mediMaker
			) {
		
		
		Map<String, Object> modelMap = mediService.mediList(pageNum, mediCode, mediName, mediEff, mediMaker);
		
		model.addAllAttributes(modelMap);
		System.out.println("Controller에서 "+pageNum+mediCode +"받을 수 있어요"+modelMap.get("listCount"));
		
		return "/Juhwa/medicineSearch";
	}
	
	@RequestMapping(value = {"/search"})
	public String searchMedi() {
		
		return "/Juhwa/mediSearch";
	}
	
	@RequestMapping(value = {"/search2"})
	public String searchMedi2() {
		
		return "/Juhwa/mediIntro";
	}
	
	@RequestMapping(value = {"/allList"})
	public String medi(Model model, @RequestParam(value="pageNum", required=false, defaultValue="1") int pageNum) {
		
	
		Map<String, Object> modelMap = mediService.mediList2(pageNum);
		
 		model.addAllAttributes(modelMap);
		
		return "/Juhwa/medicineSearch";
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
	@RequestMapping(value= {"/medicalNews"}) 
	public String crawl(Model model) {
		System.out.println("crawl 실행한다");
		
		Map<String, Object> map1 = new HashMap();
		
		try {
		
			map1 = crawl.crawlmethod();
			
		} catch (Exception e) {
	
			e.printStackTrace();
			System.out.println(e);
		}
		
		
		model.addAllAttributes(map1);
		return "/Juhwa/medicalNews";
	}
}
