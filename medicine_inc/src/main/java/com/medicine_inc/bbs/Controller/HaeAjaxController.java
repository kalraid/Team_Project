package com.medicine_inc.bbs.Controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.medicine_inc.bbs.domain.GuestReply;
import com.medicine_inc.bbs.domain.Hospital;
import com.medicine_inc.bbs.domain.Pharmacy;
import com.medicine_inc.bbs.haejin.JinService;

@Controller
public class HaeAjaxController {
	@SuppressWarnings("unused")
	private final static String DEFAULT_PATH = "/resources/upload/";
	
	@Autowired
	private JinService service;
	
	
	@RequestMapping("/mapAajx.ajax")
	@ResponseBody
	public List<Pharmacy> mapAjax(String lat, String lng){
		// 나중에 설정 제거 
		//lat = "37.535744"; lng = "127.082496";
		List<Pharmacy> list = service.radiansList(lat, lng);
	return  list;
	}
	
	@RequestMapping("/hospiMapAjax.ajax")
	@ResponseBody
	public List<Hospital> hosMapAjax(String lat, String lng){
		List<Hospital> hList = service.radiansListHospital(lat, lng);
	return hList;
	}
	
	
	@RequestMapping(value="/setgprly.ajax", method=RequestMethod.POST)
	@ResponseBody
	public List<GuestReply> addgrply(GuestReply reply, String bno, String btype, String pass){
		int bbno = Integer.parseInt(bno);
		int bbtype = Integer.parseInt(btype);
		reply.setBno(Integer.parseInt(bno));
		reply.setBtype(Integer.parseInt(btype));
		reply.setPass(Integer.parseInt(pass));
		service.setGReply(reply);
		List<GuestReply> greplyList = service.greplyList(bbno, bbtype);
		return greplyList;
	}
	
	@RequestMapping("/repassCheck.ajax")
	@ResponseBody
	public List<GuestReply> deletegReply(String no, String pass, String bno, String btype){
		int no1 = Integer.parseInt(no);
		int pass1 = Integer.parseInt(pass);
		boolean result = service.greplyPassCheck(no1, pass1);
		
		if(result == true) {
			service.deletegReply(no1);
		}
		int bbno = Integer.parseInt(bno);
		int bbtype = Integer.parseInt(btype);
		List<GuestReply> greplyList = service.greplyList(bbno, bbtype);
		return greplyList;
	}
	
	@RequestMapping("/reUpdate.ajax")
	@ResponseBody
	public  List<GuestReply> reUpdate (GuestReply reply){
		boolean result = service.greplyPassCheck(reply.getNo(), reply.getPass());
		if(result == true) {
			service.reUpdate(reply);
		}
		List<GuestReply> greplyList = service.greplyList(reply.getBno(), reply.getBtype());
		return greplyList;
	}
	
	@RequestMapping("/pSearch.ajax")
	@ResponseBody
	public  Map<String, Object> pSearchList (Model model, String sidoname, String name, @RequestParam(value="pageNum", required=false, defaultValue="1") int pageNum){
		Map<String, Object> modelMap= service.pSearchList(sidoname, name, pageNum);
		model.addAllAttributes(modelMap);
		return modelMap;
	}
	
	
}
