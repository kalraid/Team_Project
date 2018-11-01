package com.medicine_inc.bbs.gugyeong;

import java.util.List;
import java.util.Map;

import com.medicine_inc.bbs.domain.JiwonBoard;

public interface JiwonBoardService {
	/*
	 * BoardDao를 이용해 게시판 테이블에서 현재 페이지에 해당하는 게시 글 리스트를 읽어와 반환 하는 메소드
	 **/
	public abstract Map<String, Object> jiwonBoardList(int pageNum);

	public abstract void jiwonInsertBoard(JiwonBoard jiwonBoard);
	
	public abstract JiwonBoard getJiwonBoard(int bno);

	JiwonBoard getJiwonBoard(int bno, boolean isCount);
	
	public abstract void updateBoard(JiwonBoard jiwonBoard);

	public static boolean isPassCheck(int bno, String pass) {
		return false;
	}

	public abstract void deleteBoard(int bno);




	}
	
	

