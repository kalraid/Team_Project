package com.medicine_inc.bbs.kyungmin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.medicine_inc.bbs.domain.Jiap;

@Service
public class JiapServiceImpl implements JiapService {

	private static final int PAGE_SIZE = 10;
	private static final int PAGE_GROUP = 10;
	
	
	@Autowired
	private JiapDao jiapDao; 
	
	public void setJiapDao(JiapDao jiapDao) {
		this.jiapDao = jiapDao;
	}
	@Override
	public Map<String, Object> jiapList(int pageNum) {
		int currentPage = pageNum;
		int startRow = (currentPage - 1) * PAGE_SIZE;
		int listCount = jiapDao.getJiapCount();
		if(listCount > 0) {
			List<Jiap> jiapList = jiapDao.jiapList(startRow, PAGE_SIZE);
			int pageCount = listCount / PAGE_SIZE + (listCount % PAGE_SIZE == 0 ? 0 : 1);
			int startPage = (currentPage / PAGE_GROUP) * PAGE_GROUP + 1 - (currentPage % PAGE_GROUP == 0 ? PAGE_GROUP : 0);
			int endPage = startPage + PAGE_GROUP - 1;
			if(endPage > pageCount) {
				endPage = pageCount;
			}
			Map<String, Object> modelMap = new HashMap<String, Object>();
			modelMap.put("jiapList", jiapList);
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
}
