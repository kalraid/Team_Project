package com.medicine_inc.bbs.juhwa;

import java.util.List;
import java.util.Map;

import com.medicine_inc.bbs.domain.Medi;



public interface MediService {
	
	public abstract Map<String, Object> mediList(int pageNum, String mediCode, String mediName, String mediEff, String mediMaker);
	
	public abstract Medi getMedi(int no);
	
	
}
