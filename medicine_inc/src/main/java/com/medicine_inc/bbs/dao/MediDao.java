package com.medicine_inc.bbs.dao;

import java.util.List;

import com.medicine_inc.bbs.domain.*;

public interface MediDao {
	public abstract List<Medi> mediList(int no, int startRow);
	
	public abstract Medi getMedi(int no);
}
