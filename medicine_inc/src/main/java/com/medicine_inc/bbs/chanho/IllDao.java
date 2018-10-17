package com.medicine_inc.bbs.chanho;

import java.util.List;

import com.medicine_inc.bbs.domain.IllList;

public interface IllDao {
	
	public abstract List<IllList> IllList(int startRow, int pageNum, String keyword, String type);
	
	// 글수 반환 메서드
	public abstract int getIllCount(String keyword, String type, int hid, int startRow, int pageNum);
	
	
	// 질병 정보 한세트를 반환하는 메서드
	public abstract IllList IllListDetail(int code);
}
