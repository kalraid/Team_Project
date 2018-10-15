package com.medicine_inc.bbs.Controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.medicine_inc.bbs.domain.Firstaid;
import com.medicine_inc.bbs.kyungmin.FirstaidService;
import com.medicine_inc.bbs.kyungmin.StretchingService;

@Controller
public class KyungController {
	
	@Autowired
	private FirstaidService firstaidService;
	
	@Autowired
	private StretchingService stretchingService;
	
	public void setFirstaidService(FirstaidService firstaidService) {
		this.firstaidService = firstaidService;
	}
	
	public void setStretchingService(StretchingService stretchingService) {
		this.stretchingService = stretchingService;
	}
	
	@SuppressWarnings("unused")
	private final static String DEFAULT_PATH = "/resources/upload/";

	
	@RequestMapping(value= 
		{"/FirstAid","/firstAid","/Firstaid","/firstaid","/firstaidList"})
	public String firstaidList(Model model,@RequestParam(value="pageNum", required=false, defaultValue="1")int pageNum){
	
		Map<String, Object> modelMap = firstaidService.firstaidList(pageNum);
		model.addAllAttributes(modelMap);
	return "/Kyungmin/firstaidList";
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
	@RequestMapping(value= {"/stretching","/Stretching","/stretchingList"})
	public String stretching(Model model,@RequestParam(value="pageNum", required=false, defaultValue="1")int pageNum){
	 Map<String, Object> modelMap = stretchingService.stretchinList(pageNum);
	 model.addAllAttributes(modelMap);
	 
	return "/Kyungmin/stretchingList";
	}
	
	
}
