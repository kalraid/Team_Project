package com.medicine_inc.bbs.haejin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.support.TransactionTemplate;

import com.medicine_inc.bbs.domain.AnimalHospital;
import com.medicine_inc.bbs.domain.GuestReply;
import com.medicine_inc.bbs.domain.Hospital;
import com.medicine_inc.bbs.domain.Pharmacy;

@Service
public class JinServiceImpl implements JinService{
	
	private static final int PAGE_SIZE = 10;
	private static final int PAGE_GROUP = 10;

	@Autowired
	private JinDao dao;
	@Autowired
	private TransactionTemplate transactionTemplate;
	
	public void setJinDao(JinDao dao) {
		this.dao = dao;
		
	}
	
	@Override
	public List<Pharmacy> radiansList(String lat, String lng) {
		return dao.radiansList(lat, lng);
	}

	@Override
	public List<Hospital> radiansListHospital(String lat, String lng) {
		return dao.radiansListHospital(lat, lng);
	}

	@Override
	public Pharmacy getPharmacy(String no) {
		return dao.getPharmacy(no);
	}

	@Override
	public Hospital getHospital(String no) {
		return dao.getHospital(no);
	}

	@Override
	public void setGReply(GuestReply reply) {
		dao.setGReply(reply);
	}

	@Override
	public List<GuestReply> greplyList(int bno, int btype) {
		return dao.greplyList(bno, btype);
	}

	@Override
	public boolean greplyPassCheck(int no, int pass) {
		return dao.greplyPassCheck(no, pass);
	}

	@Override
	public void deletegReply(int no) {
		dao.deletegReply(no);
	}

	@Override
	public void reUpdate(GuestReply reply) {
		dao.reUpdate(reply);
	}

	@Override
	public Map<String, Object> pSearchList(String sidoname, String name, int pageNum) {
		//현재 페이지 설정
		int currentPage = pageNum;
		int startRow = (currentPage - 1) * PAGE_SIZE;
		int listCount = dao.pgetListCount(sidoname, name);
		
		if(listCount >0) {
			List<Pharmacy> pSearchList = dao.pSearchList(sidoname, name, startRow, PAGE_SIZE);
			int pageCount = listCount / PAGE_SIZE + (listCount % PAGE_SIZE == 0 ? 0 : 1);
			int startPage = (currentPage / PAGE_GROUP) * PAGE_GROUP + 1
					- (currentPage % PAGE_GROUP == 0 ? PAGE_GROUP : 0);
			int endPage = startPage + PAGE_GROUP - 1;
		
			if(endPage > pageCount) {
				endPage = pageCount;
				}
			System.out.println("endPage : " + endPage);
			System.out.println("ServiceImpl startPage : "+startPage);
			System.out.println("ServiceImpl pageGroup : "+PAGE_GROUP);
			Map<String, Object> modelMap = new HashMap<String, Object>();
			modelMap.put("pSearchList", pSearchList);
			modelMap.put("pageCount", pageCount);
			modelMap.put("startPage", startPage);
			modelMap.put("endPage", endPage);
			modelMap.put("currentPage", currentPage);
			modelMap.put("listCount", listCount);
			modelMap.put("pageGroup", PAGE_GROUP);
			return modelMap;
		}
		return null;
	}

	@Override
	public Map<String, Object> aniSearchList(String sidoname, String name, int pageNum) {
		//현재 페이지 설정
				int currentPage = pageNum;
				int startRow = (currentPage - 1) * PAGE_SIZE;
				int listCount = dao.aniSearchCount(sidoname, name);
				
				if(listCount >0) {
					List<AnimalHospital> pSearchList = dao.aniSearchList(sidoname, name, startRow, PAGE_SIZE);
					int pageCount = listCount / PAGE_SIZE + (listCount % PAGE_SIZE == 0 ? 0 : 1);
					int startPage = (currentPage / PAGE_GROUP) * PAGE_GROUP + 1
							- (currentPage % PAGE_GROUP == 0 ? PAGE_GROUP : 0);
					int endPage = startPage + PAGE_GROUP - 1;
				
					if(endPage > pageCount) {
						endPage = pageCount;
						}
					System.out.println("endPage : " + endPage);
					System.out.println("ServiceImpl startPage : "+startPage);
					System.out.println("ServiceImpl pageGroup : "+PAGE_GROUP);
					Map<String, Object> modelMap = new HashMap<String, Object>();
					modelMap.put("pSearchList", pSearchList);
					modelMap.put("pageCount", pageCount);
					modelMap.put("startPage", startPage);
					modelMap.put("endPage", endPage);
					modelMap.put("currentPage", currentPage);
					modelMap.put("listCount", listCount);
					modelMap.put("pageGroup", PAGE_GROUP);
					return modelMap;
				}
				return null;
	}


}
