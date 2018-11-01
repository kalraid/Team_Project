package com.medicine_inc.bbs.gugyeong;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.medicine_inc.bbs.aehee.HealthSupportDao;
import com.medicine_inc.bbs.domain.JiwonBoard;

@Service
public class JiwonBoardServiceImpl implements JiwonBoardService {
	private static final int PAGE_SIZE = 10;
	
	private static final int PAGE_GROUP = 10;
	@Autowired
	private JiwonBoardDao jiwonBoardDao;

	
	public void setBoardDao(JiwonBoardDao jiwonBoardDao) {
		this.jiwonBoardDao = jiwonBoardDao;
	}


	/*
	 * BoardDao를 이용해 게시판 테이블에서 현재 페이지에 해당하는 게시 글 리스트를 읽어와 반환 하는 메소드
	 **/
	@Override
	public Map<String,Object> jiwonBoardList(int pageNum){
		int currentPage = pageNum;
		
		int startRow = (currentPage - 1 ) * PAGE_SIZE;
		
		int listCount = jiwonBoardDao.getBoardCount();
		
		if(listCount>0) {
			List<JiwonBoard> jiwonBoardList = jiwonBoardDao.jiwonBoardList(startRow,PAGE_SIZE);
			
			
			int pageCount= listCount/PAGE_SIZE + (listCount % PAGE_SIZE == 0? 0 : 1);
			
			
			int startPage = (currentPage/PAGE_GROUP) * PAGE_GROUP +1 -(currentPage % PAGE_GROUP ==0 ? PAGE_GROUP :0);
			
			int endPage = startPage + PAGE_GROUP -1;
			
			if(endPage > pageCount) {
				endPage = pageCount;
			}
			Map<String,Object> modelMap = new HashMap<String, Object>();
			
			modelMap.put("jiwonBoardList", jiwonBoardList);
			modelMap.put("pageCOunt",pageCount);
			modelMap.put("startPage",startPage);
			modelMap.put("endPage",endPage);
			modelMap.put("currentPage",currentPage);
			modelMap.put("listCount",listCount);
			modelMap.put("PAGE_GROUP", PAGE_GROUP);
			
			return modelMap;
			
			
		}else {
			return null;
		}
		
	}
	
	@Override
	public void jiwonInsertBoard(JiwonBoard jiwonBoard) {
		jiwonBoardDao.jiwonInsertBoard(jiwonBoard);
	}

	public boolean isPassCheck(int bno , String pass) {
		return jiwonBoardDao.isPassCheck(bno, pass);
	}
	
	@Override
	public JiwonBoard getJiwonBoard(int bno, boolean isCount) {
		return jiwonBoardDao.getJiwonBoard(bno, isCount);
	}


	@Override
	public JiwonBoard getJiwonBoard(int bno) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public void updateBoard(JiwonBoard jiwonBoard) {
		jiwonBoardDao.updateBoard(jiwonBoard);
		
	}

	@Override
	public void deleteBoard(int bno) {
	jiwonBoardDao.deleteBoard(bno);
	}

	
}
