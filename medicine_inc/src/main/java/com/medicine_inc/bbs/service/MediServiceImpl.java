package com.medicine_inc.bbs.service;

import java.util.List;

import com.medicine_inc.bbs.dao.MediDao;
import com.medicine_inc.bbs.domain.Medi;


public class MediServiceImpl implements MediService {
	
	private MediDao dao;
	@Override
	public List<Medi> getMedi(int no, int startRow) {
		
		return dao.mediList(no, startRow);
	}

}
