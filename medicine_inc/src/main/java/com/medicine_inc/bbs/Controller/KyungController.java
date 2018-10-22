package com.medicine_inc.bbs.Controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.medicine_inc.bbs.domain.Firstaid;
import com.medicine_inc.bbs.domain.Jiap;
import com.medicine_inc.bbs.domain.Stretching;
import com.medicine_inc.bbs.kyungmin.FirstaidService;
import com.medicine_inc.bbs.kyungmin.JiapService;
import com.medicine_inc.bbs.kyungmin.StretchingService;

@Controller
public class KyungController {
	
	@Autowired
	private FirstaidService firstaidService;
	
	@Autowired
	private StretchingService stretchingService;
	
	@Autowired
	private JiapService jiapService;
	
	public void setFirstaidService(FirstaidService firstaidService) {
		this.firstaidService = firstaidService;
	}
	
	public void setStretchingService(StretchingService stretchingService) {
		this.stretchingService = stretchingService;
	}
	
	public void setJiapService(JiapService jiapService) {
		this.jiapService = jiapService;
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
	
	
	
	@RequestMapping(value= {"/jiapList","/jiap"})
	public String jiapList(Model model,@RequestParam(value="pageNum", required=false,defaultValue="1") int pageNum) {
		Map<String, Object> modelMap = jiapService.jiapList(pageNum);
		model.addAllAttributes(modelMap);
		return "/Kyungmin/jiapList";
	}
	
	@RequestMapping(value= 
		{"/HealthScreening","/healthScreening","/Healthscreening","/healthscreening"})
	public String healthScreening(Model model){
	
	return "/Kyungmin/healthScreening";
	}

	@RequestMapping(value= {"/quiz","/Quiz","/quizList"})
	public String quiz(Model model){
	
	return "/Kyungmin/quizList";
	}
	
	@RequestMapping(value= {"/photoTest"})
	public String photoTest(Model model) {
		return "/Kyungmin/photoTest";
	}
	
	@RequestMapping(value= {"/eyeTest"})
	public String eyeTest(Model model) {
		return "/Kyungmin/eyeTest";
	}
	
	@RequestMapping(value= {"/realEyeTest"})
	public String realEyeTest(Model model) {
		return "forward:WEB-INF/views/Kyungmin/realEyeTest.jsp";
	}
	
	@RequestMapping(value= {"/stretching","/Stretching","/stretchingList"})
	public String stretching(Model model,@RequestParam(value="pageNum", required=false, defaultValue="1")int pageNum){
	 Map<String, Object> modelMap = stretchingService.stretchinList(pageNum);
	 model.addAllAttributes(modelMap);
	 
	return "/Kyungmin/stretchingList";
	}
	
	@RequestMapping("/firstaidDetail")
	public String firstaidDetail(Model model, int firstaidnum, @RequestParam(value="pageNum", required=false, defaultValue="1")
	int pageNum) {
		Firstaid f = firstaidService.getFirstaid(firstaidnum);
		model.addAttribute("f",f);
		model.addAttribute("pageNum",pageNum);
		return "/Kyungmin/firstaidDetail";
	}
	@RequestMapping("/stretchingDetail")
	public String stretchingDetail(Model model, int stretchingnum,@RequestParam(value="pageNum", required=false, defaultValue="1")
	int pageNum) {
		Stretching s = stretchingService.getStretching(stretchingnum);
		model.addAttribute("s",s);
		model.addAttribute("pageNum",pageNum);
		return "/Kyungmin/stretchingDetail";
	}
}
