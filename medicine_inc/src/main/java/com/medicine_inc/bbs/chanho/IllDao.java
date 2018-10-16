package com.medicine_inc.bbs.chanho;

import java.util.List;

import com.medicine_inc.bbs.domain.IllList;

public interface IllDao {
	
	public abstract List<IllList> IllList(int startRow, int num, String keyword, String type);
	
	/* 게시 글 수를 계산하기 위해 호출되는 메서드 - paging 처리에 사용
	 * 게시 글 리스트와 검색 리스트에 대한 게시 글 수를 반환 하는 메서드
	 **/
	public abstract int getIllCount(String keyword, String type, int hid);
	
}
