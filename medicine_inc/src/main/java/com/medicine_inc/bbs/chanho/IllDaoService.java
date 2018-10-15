package com.medicine_inc.bbs.chanho;

import java.util.Map;

public interface IllDaoService {

	
	public abstract Map<String, Object> IllList(int pageNum, String keyword);
}
