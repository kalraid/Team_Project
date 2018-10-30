package com.medicine_inc.bbs.aehee;

import java.util.Map;

import com.medicine_inc.bbs.domain.HealthSupport;

public interface HealthSupportService {

	/* BoardDao를 이용해 게시판 테이블에서
	 * 현재 페이지에 해당하는 게시 글 리스트를 읽어와 반환 하는 메소드
	 **/
/*	public abstract List<Board> boardList(int startRow, int num);
	*/
	/* BoardDao를 이용해 게시판 테이블에서
	 * no에 해당하는 게시 글 을 읽어와 반환하는 메서드 
	 **/	
	public abstract HealthSupport getBoard(int no);
	// BoardDao를 이용해 새로운 게시 글을 추가하는 메서드
	public abstract void insertBoard(HealthSupport healthSupport);

	
	
	// BoardDao를 이용해 게시 글을 수정하는 메서드
	public abstract void updateBoard(HealthSupport healthSupport);
	
	// BoardDao를 이용해 no에 해당하는 게시 글을 삭제하는 메서드
	public abstract void deleteBoard(int no);
	
	public abstract Map<String, Object> boardList(int pageNum, int cateCode);
}
