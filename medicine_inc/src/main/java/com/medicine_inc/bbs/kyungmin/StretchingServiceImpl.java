package com.medicine_inc.bbs.kyungmin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.medicine_inc.bbs.domain.Stretching;

@Service
public class StretchingServiceImpl implements StretchingService {

	private static final int PAGE_SIZE = 5;
	private static final int PAGE_GROUP = 10;
	
	@Autowired
	private StretchingDao stretchingDao;
	
	public void setStretchingDao(StretchingDao stretchingDao) {
		this.stretchingDao = stretchingDao;
	}
	
	@Override
	public Map<String, Object> stretchinList(int pageNum) {
		int currentPage = pageNum;
		int startRow = (currentPage - 1) * PAGE_SIZE;
		int listCount = stretchingDao.getStretchingCount();
		
		if(listCount > 0) {
			List<Stretching> stretchingList = stretchingDao.stretchingList(startRow, PAGE_SIZE);
			int pageCount = listCount / PAGE_SIZE + (listCount % PAGE_SIZE == 0 ? 0 : 1);
			int startPage = (currentPage / PAGE_GROUP) * PAGE_GROUP + 1 - (currentPage % PAGE_GROUP == 0 ? PAGE_GROUP : 0);
			int endPage = startPage + PAGE_GROUP - 1;
			
			if(endPage > pageCount) {
				endPage = pageCount;
			}
			
			Map<String, Object> modelMap = new HashMap<String, Object>();
			
			modelMap.put("stretchingList", stretchingList);
			modelMap.put("pageCount", pageCount);
			modelMap.put("startPage", startPage);
			modelMap.put("endPage", endPage);
			modelMap.put("currentPage", currentPage);
			modelMap.put("listCount", listCount);
			modelMap.put("PAGE_GROUP", PAGE_GROUP);
			
			return modelMap;
		}
		else {
			return null;
		}
	}
	
	@Override
	public Stretching getStretching(int stretchingnum) {
		return stretchingDao.getStretching(stretchingnum);
	}
}
