package com.medicine_inc.bbs.Controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.medicine_inc.bbs.chanho.IllDaoService;
import com.medicine_inc.bbs.chanho.foodService;
import com.medicine_inc.bbs.domain.IllList;
import com.medicine_inc.bbs.domain.food;

@Controller
public class HoController {
	@SuppressWarnings("unused")
	private final static String DEFAULT_PATH = "/resources/upload/";

	@Autowired
	private IllDaoService illDaoService;

	@Autowired
	private foodService foodService;
	
	public HoController() {
	};

	public void setIllDaoService(IllDaoService illDaoService) {
		this.illDaoService = illDaoService;
	}

	public void setFoodService(foodService foodService) {
		this.foodService = foodService;
	}
	
	@RequestMapping(value = { "/sitemap", "/Sitemap" })
	public String sitemap(Model model) {

		return "/Chanho/sitemap";
	}

	@RequestMapping(value = { "/ill", "/Ill" })
	public String ill(Model model, @RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum,
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
			@RequestParam(value = "type", required = false, defaultValue = "") String type,
			@RequestParam(value = "hid", required = false, defaultValue = "0") int hid) throws UnsupportedEncodingException {
		System.out.println("리스트 : " + pageNum + ", " + type + ", " + keyword + ", " + hid);
		Map<String, Object> modelMap = illDaoService.IllList(pageNum, keyword, type, hid);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("keyword", URLEncoder.encode(keyword, "utf-8"));
		model.addAttribute("word", keyword);
		model.addAttribute("type", type);
		model.addAttribute("hid", hid);
		model.addAllAttributes(modelMap);
		return "/Chanho/ill";
	}

	@RequestMapping(value = { "/illdetail", "/Illdetail", "/illDetail", "/IllDetail" }, method = RequestMethod.GET)
	public String illdetail(Model model,
			@RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum,
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
			@RequestParam(value = "type", required = false, defaultValue = "") String type,
			@RequestParam(value = "hid", required = false, defaultValue = "0") int hid,
			@RequestParam(value = "no", required = false, defaultValue = "0") int no) throws UnsupportedEncodingException {
		System.out.println("디테일  " + pageNum + "," + keyword + "," + type + "," + hid + "," + no);
		IllList IllList = illDaoService.IllListDetail(no);

		model.addAttribute("pageNum", pageNum);
		model.addAttribute("keyword", URLEncoder.encode(keyword, "utf-8"));
		model.addAttribute("word", keyword);
		model.addAttribute("type", type);
		model.addAttribute("hid", hid);
		model.addAttribute("IllList", IllList);
		model.addAttribute("no", no);
		return "/Chanho/illdetail";
	}

	@RequestMapping(value = { "/food", "/Food" })
	public String food(Model model, HttpSession session) {
		
		List<food> foodList = foodService.foodList();
		model.addAttribute("food",foodList);
		session.setAttribute("id","홍길동");
		
		
		return "/Chanho/food";
	}

	@RequestMapping(value = { "/epidemicMaps", "/EpidemicMaps", "/epidemicmaps", "/Epidemicmaps" })
	public String epidemicMaps(Model model, HttpSession session) {
		session.setAttribute("id","미");
		return "/Chanho/epidemicMaps";
	}

	@RequestMapping(value = { "/cheeting", "/Cheeting" })
	public String cheeting(HttpSession session) {
		String id = (String) session.getAttribute("id");
		/*session.setAttribute("id",id);*/
		return "/Chanho/cheeting";
	}

	@RequestMapping(value= 
		{"/depressed","/Depressed"})
	public String depressed(Model model){
	
		return "/Changmyoung/depressed";
	}
	
}
