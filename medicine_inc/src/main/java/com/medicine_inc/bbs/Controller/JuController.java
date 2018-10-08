package com.medicine_inc.bbs.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class JuController {
	@SuppressWarnings("unused")
	private final static String DEFAULT_PATH = "/resources/upload/";
	
	@RequestMapping(value= 
		{"/MedicineSearch","/medicineSearch","/Medicinesearch","/medicinesearch"})
	public String medicineSearch(Model model){
	
	return "/Juhwa/medicineSearch";
	}
	
	
}
