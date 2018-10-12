package com.medicine_inc.bbs.juhwa;

import java.util.List;

import com.medicine_inc.bbs.domain.*;

public interface MediDao {
	public abstract List<Medi> mediList(int no, int startRow);
	
	public abstract Medi getMedi(int no);
}
