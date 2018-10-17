package com.medicine_inc.bbs.chanho;

import java.util.Map;

import com.medicine_inc.bbs.domain.IllList;

public interface IllDaoService {

	
	public abstract Map<String, Object> IllList(int pageNum, String keyword, String type, int hid);
	
	public abstract IllList IllListDetail(int code);
}
