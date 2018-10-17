package com.medicine_inc.bbs.chanho;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.medicine_inc.bbs.domain.IllList;

@Service
public class IllDaoServiceImpl implements IllDaoService {

	// 한 페이지에 보여 줄 게시 글의 수를 상수로 선언
	private static final int PAGE_SIZE = 10;

	/*
	 * 한 페이지에 보여질 페이지 그룹의 수를 상수로 선언 [이전] 1 2 3 4 5 6 7 8 9 10 [다음]
	 **/
	private static final int PAGE_GROUP = 10;

	@Autowired
	private IllDao illdao;

	public IllDaoServiceImpl() {};
	public IllDao getIlldao() {
		return illdao;
	}

	@Override
	public Map<String, Object> IllList(int pageNum, String keyword, String type, int hid) {

		// 요청 파라미터의 pageNum을 현재 페이지로 설정
		int currentPage = pageNum;

		// 시작페이지 숫자 = startRow
		int startRow = (currentPage - 1) * PAGE_SIZE;
		int listCount = 0;

		listCount = illdao.getIllCount(keyword, type, hid, startRow, PAGE_SIZE);
		if (listCount > 0) {
			List<IllList> IllList = illdao.IllList(startRow, PAGE_SIZE, keyword, type);
			int pageCount = listCount / PAGE_SIZE + (listCount % PAGE_SIZE == 0 ? 0 : 1);

			int startPage = (currentPage / PAGE_GROUP) * PAGE_GROUP + 1
					- (currentPage % PAGE_GROUP == 0 ? PAGE_GROUP : 0);

			int endPage = startPage + PAGE_GROUP - 1;

			if (endPage > pageCount) {
				endPage = pageCount;
			}

			Map<String, Object> modelMap = new HashMap<String, Object>();

			modelMap.put("IllList", IllList);
			modelMap.put("pageCount", pageCount);
			modelMap.put("startPage", startPage);
			modelMap.put("endPage", endPage);
			modelMap.put("currentPage", currentPage);
			modelMap.put("listCount", listCount);
			modelMap.put("pageGroup", PAGE_GROUP);
			modelMap.put("pageNum", pageNum);
			modelMap.put("word", keyword);
			modelMap.put("type", type);
			modelMap.put("hid", hid);
			return modelMap;	
		}else {
			return null;
		}

		
	}
	@Override
	public IllList IllListDetail(int code) {
		
		return illdao.IllListDetail(code);
	}

}
