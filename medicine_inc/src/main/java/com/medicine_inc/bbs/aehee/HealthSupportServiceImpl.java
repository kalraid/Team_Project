package com.medicine_inc.bbs.aehee;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.medicine_inc.bbs.domain.HealthSupport;

@Service
public class HealthSupportServiceImpl implements HealthSupportService {

	private static final int PAGE_SIZE = 10;
	
	private static final int PAGE_GROUP = 10;
	
	
	@Autowired
	private HealthSupportDao healthSupportDao;
	

	@Override
	public HealthSupport getBoard(int no) {
		return healthSupportDao.getBoard(no);
	}
	// BoardDao를 이용해 새로운 게시 글을 추가하는 메서드
	@Override
	public void insertBoard(HealthSupport healthSupport) {
		healthSupportDao.insertBoard(healthSupport);
	}	
	
	// BoardDao를 이용해 게시 글을 수정하는 메서드
	@Override
	public void updateBoard(HealthSupport healthSupport) {
		healthSupportDao.updateBoard(healthSupport);
	}

	// BoardDao를 이용해 no에 해당하는 게시 글을 삭제하는 메서드
	@Override
	public void deleteBoard(int no) {
		healthSupportDao.deleteBoard(no);
	}
	
	@Override
	public Map<String, Object> boardList(int pageNum, int cateCode) {
		
		int currentPage = pageNum;
		int startRow = (currentPage - 1) * PAGE_SIZE;
		int listCount = 0;
		
		listCount = healthSupportDao.getBoardCount(cateCode);
		
		System.out.println("listCount :" + listCount + ", cateCode :" + cateCode);
		
		
		List<HealthSupport> healthSupport = healthSupportDao.boardList(startRow, PAGE_SIZE, cateCode);
		
		int pageCount =
				listCount / PAGE_SIZE + (listCount % PAGE_SIZE == 0 ? 0 : 1);
		
		int startPage = (currentPage / PAGE_GROUP) * PAGE_GROUP + 1
					- (currentPage % PAGE_GROUP == 0 ? PAGE_GROUP : 0);
		
		int endPage = startPage + PAGE_GROUP - 1;
		
		
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		
		Map<String, Map> cateCodeMap = healthSupportDao.cateCodeCountMap();
		System.out.println("cateCodeMap : "  + cateCodeMap.get(1001).get("count") + ", " + cateCodeMap);
		
		Map<String, Object> codeMap = new HashMap<String, Object>();
		codeMap.put("1001", cateCodeMap.get(1001) != null ? cateCodeMap.get(1001).get("count") : null);
		codeMap.put("1002", cateCodeMap.get(1002) != null ? cateCodeMap.get(1002).get("count") : null);
		codeMap.put("1003", cateCodeMap.get(1003) != null ? cateCodeMap.get(1003).get("count") : null);
		codeMap.put("1004", cateCodeMap.get(1004) != null ? cateCodeMap.get(1004).get("count") : null);
		codeMap.put("1005", cateCodeMap.get(1005) != null ? cateCodeMap.get(1005).get("count") : null);
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		modelMap.put("boardList", healthSupport);
		modelMap.put("pageCount", pageCount);
		modelMap.put("startPage", startPage);
		modelMap.put("endPage", endPage);
		modelMap.put("currentPage", currentPage);
		modelMap.put("listCount", listCount);
		modelMap.put("PAGE_GROUP", PAGE_GROUP);			
		modelMap.put("codeMap", codeMap);
		modelMap.put("cateCode", cateCode);
		System.out.println("cateCode : " + cateCode);
		return modelMap;
	}
	
	public boolean isPassCheck(int no, String pass) {
		return HealthSupportDao.isPassCheck(no, pass);
	}
}
