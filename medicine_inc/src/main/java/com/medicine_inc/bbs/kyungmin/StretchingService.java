package com.medicine_inc.bbs.kyungmin;

import java.util.Map;

import com.medicine_inc.bbs.domain.Stretching;

public interface StretchingService {

	public abstract Map<String, Object> stretchinList(int pageNum);
	
	public abstract Stretching getStretching(int stretchingnum);
}
