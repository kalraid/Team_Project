package com.medicine_inc.bbs.juhwa;

import java.util.List;

import com.medicine_inc.bbs.domain.*;

public interface MediDao {
	public abstract List<Medi> mediList(int startRow, int num, String mediCode, String mediName, String mediEff, String mediMaker);
	
	public abstract int getMediCount(String mediCode, String mediName, String mediEff, String mediMaker );

	public abstract Medi getMedi(int no);
}
