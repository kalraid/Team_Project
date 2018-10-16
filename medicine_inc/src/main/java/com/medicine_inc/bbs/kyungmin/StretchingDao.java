package com.medicine_inc.bbs.kyungmin;

import java.util.List;

import com.medicine_inc.bbs.domain.Stretching;

public interface StretchingDao {

	public abstract List<Stretching> stretchingList(int startRow, int num);
	
	public abstract int getStretchingCount();
	
	public abstract Stretching getStretching(int stretchingnum);
}
