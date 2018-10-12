package com.medicine_inc.bbs.chanho;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.medicine_inc.bbs.domain.IllList;

@Service
public class IllDaoServiceImpl implements IllDaoService{

	@Autowired
	private IllDao illdao;
	
	public IllDao getIlldao() {
		return illdao;
	}
	
	@Override
	public List<IllList> IllList() { 

		
		return illdao.IllList();
	}







	
}
