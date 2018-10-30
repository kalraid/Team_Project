package com.medicine_inc.bbs.juhwa;


import java.util.HashMap;

import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Crawl {
	
	@Autowired
	public Map<String, Object> crawlmethod() throws Exception {
		String URL = "http://www.bokuennews.com/news/section1.html?sec_no=71";
        Document doc = Jsoup.connect(URL).get();
        String domain = "http://www.bokuennews.com";
           
        Elements elem4 = doc.select(".m01_arl40");
        
        for(Element e : elem4) {
        	
        	Elements dlElem = e.select("dl");
        	for(Element subE : dlElem) {
        		subE.select("a").attr("href", domain + subE.select("a").attr("href"));
        		System.out.println(subE.select("a").attr("href"));
        	}
        	
        }
        
        Map<String, Object> map1 = new HashMap();
        map1.put("elem4", elem4);        
        return map1;
	}

}


