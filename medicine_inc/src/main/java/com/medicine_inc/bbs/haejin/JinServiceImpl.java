package com.medicine_inc.bbs.haejin;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.support.TransactionTemplate;

import com.medicine_inc.bbs.domain.Pharmacy;

@Service
public class JinServiceImpl implements JinService{

	@Autowired
	private JinDao dao;
	@Autowired
	private TransactionTemplate transactionTemplate;
	
	public void setJinDao(JinDao dao) {
		this.dao = dao;
	}
	
	@Override
	public List<Pharmacy> radiansList(String lat, String lng) {
		return dao.radiansList(lat, lng);
	}

}
