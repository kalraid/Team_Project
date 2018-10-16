package com.medicine_inc.bbs.kyungmin;

import java.util.List;

import com.medicine_inc.bbs.domain.Firstaid;

public interface FirstaidDao {

	public abstract List<Firstaid> firstaidList(int startRow, int num);
	
	public abstract int getFirstaidCount();
	
	public abstract Firstaid getFirstaid(int firstaidnum);
}
