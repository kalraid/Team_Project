package com.medicine_inc.bbs.juhwa;

import java.util.List;

import com.medicine_inc.bbs.domain.Medi;



public interface MediService {
	
	public abstract List<Medi> getMedi(int no, int startRow);
}
