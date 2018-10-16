package com.medicine_inc.bbs.kyungmin;


import java.util.Map;

import com.medicine_inc.bbs.domain.Firstaid;

public interface FirstaidService {

	public abstract Map<String, Object> firstaidList(int pageNum);
	
	public abstract Firstaid getFirstaid(int firstaidnum);
}
