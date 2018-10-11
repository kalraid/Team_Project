package com.medicine_inc.bbs.service;

import java.util.List;

import com.medicine_inc.bbs.domain.Medi;



public interface MediService {
	
	public abstract List<Medi> getMedi(int no, int startRow);
}
