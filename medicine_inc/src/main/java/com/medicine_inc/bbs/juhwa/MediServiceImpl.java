package com.medicine_inc.bbs.juhwa;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.medicine_inc.bbs.domain.Medi;

@Service
public class MediServiceImpl implements MediService {
	
	//한 페이지에 보여 줄 게시 글의 수
	private static final int PAGE_SIZE = 10;
	private static final int PAGE_GROUP = 10;
	
	@Autowired
	private MediDao dao;
	
	public void setMediDao(MediDao mediDao) {
		this.dao = mediDao;
	}
	
	@Override
	public Map<String, Object> mediList(int pageNum, String mediCode, String mediName, String mediEff, String mediMaker) {
		
		int currentPage = pageNum;
		int startRow = (currentPage - 1) * PAGE_SIZE;
		int listCount = 0; 
		
		boolean searchOption = (mediCode.equals("null") || mediName.equals("null")||mediEff.equals("null")||mediMaker.equals("null")) ? false : true; 
		
		listCount = dao.getMediCount(mediCode, mediName, mediEff, mediMaker);
		
		System.out.println("service 에서 getmediCount 가져 옵니다"+listCount);
		
		if(listCount>=0) {
			List<Medi> mediList = dao.mediList(startRow, PAGE_SIZE, mediCode, mediName, mediEff, mediMaker);
			
			int pageCount  = listCount /PAGE_SIZE +(listCount % PAGE_SIZE == 0? 0:1);
			int startPage = (currentPage / PAGE_GROUP) * PAGE_GROUP + 1 - (currentPage % PAGE_GROUP == 0 ? PAGE_GROUP : 0);
			int endPage = startPage + PAGE_GROUP - 1;
			if(endPage > pageCount) { endPage = pageCount; }
			
			Map<String, Object> modelMap = new HashMap<String, Object>();
				modelMap.put("mediList", mediList);
				modelMap.put("pageCount", pageCount);
				modelMap.put("startPage", startPage);
				modelMap.put("endPage", endPage);
				modelMap.put("currentPage", currentPage);
				modelMap.put("listCount", listCount);
				modelMap.put("pageGroup", PAGE_GROUP);
				modelMap.put("searchOption", searchOption);
			
			
					
					try {
						modelMap.put("mediMaker",URLEncoder.encode(mediMaker, "utf-8"));
						modelMap.put("mediName",URLEncoder.encode(mediName, "utf-8"));
						modelMap.put("mediEff",URLEncoder.encode(mediEff, "utf-8"));
					} catch (UnsupportedEncodingException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
			
					modelMap.put("name", mediName);
					modelMap.put("eff", mediEff);
					modelMap.put("maker", mediMaker);
					modelMap.put("code", mediCode);
			
			
			return modelMap;
		}else {
			return null;
		}
	}
	
	@Override
	public Medi getMedi(int no) {
		return dao.getMedi(no);
	}
	
	@Override
	public Map<String, Object> mediList2(int pageNum){
		int currentPage = pageNum;
		int startRow = (currentPage - 1) * PAGE_SIZE;
		int listCount = 0; 
		
		listCount = dao.getMediCount2();
						
			List<Medi> mediList2 = dao.mediList2(startRow, PAGE_SIZE);
			
			int pageCount  = listCount /PAGE_SIZE +(listCount % PAGE_SIZE == 0? 0:1);
			int startPage = (currentPage / PAGE_GROUP) * PAGE_GROUP + 1 - (currentPage % PAGE_GROUP == 0 ? PAGE_GROUP : 0);
			int endPage = startPage + PAGE_GROUP - 1;
			if(endPage > pageCount) { endPage = pageCount; }
			
			Map<String, Object> modelMap2 = new HashMap<String, Object>();
				modelMap2.put("mediList2", mediList2);
				modelMap2.put("pageCount", pageCount);
				modelMap2.put("startPage", startPage);
				modelMap2.put("endPage", endPage);
				modelMap2.put("currentPage", currentPage);
				modelMap2.put("listCount", listCount);
				modelMap2.put("pageGroup", PAGE_GROUP);
				
			
		
		return modelMap2;
	}
}
