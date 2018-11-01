package com.medicine_inc.bbs.aehee;

import java.util.List;
import java.util.Map;

import com.medicine_inc.bbs.domain.HealthSupport;

public interface HealthSupportDao {

public abstract List<HealthSupport> boardList(int startRow, int num, int cateCode, String type, String keyword);
	
	public abstract List<HealthSupport> boardList(int startRow, int num, int cateCode);
	
	
	
	public abstract HealthSupport getBoard(int no);
	
	/* 게시 글쓰기 요청 시 호출되는 메서드
	 * 게시 글쓰기 요청 시 게시 글 내용을 Board 객체로 받아 DB에 추가하는 메서드 
	 **/
	
	public abstract int getBoardCount(int cateCode, String type, String keyword);
	
	public abstract int getBoardCount(int cateCode);
	
	public abstract void insertBoard(HealthSupport healthSupport);
	
	/* 게시 글 수정, 삭제 시 비밀번호 입력을 체크하는 메서드
	 * 
	 * - 게시 글의 비밀번호가 맞으면 : true를 반환
	 * - 게시 글의 비밀번호가 맞지 않으면 : false를 반환
	 **/
	public abstract boolean isPassCheck(int no, String pass);
	
	/* 게시 글 수정 요청 시 호출되는 메서드
	 * 게시 글 수정 요청 시 수정된 내용을 Board 객체로 받아 DB에 수정하는 메서드 
	 **/
	public abstract void updateBoard(HealthSupport healthSupport);
	
	/* 게시 글 삭제 요청 시 호출되는 메서드 
	 * no에 해당 하는 게시 글을 DB에서 삭제하는 메서드 
	 **/
	public abstract void deleteBoard(int no);
	
	
	public Map<String, Map> cateCodeCountMap();
}
