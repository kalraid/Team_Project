package com.playground.festivalservice;

import java.util.ArrayList;

import com.playground.dao.FestivalDao;
import com.playground.vo.AreaCode;
import com.playground.vo.Festival;

public class AreaDistrictgetMethod {
	
	public ArrayList<AreaCode> getAreaCode(){
		ArrayList<AreaCode> areaList = new ArrayList<AreaCode>();
		FestivalDao dao = FestivalDao.getInstance();
		areaList = dao.getAreaCode();
		return areaList;
	}
	
	public ArrayList<Festival> getSumArea(){
		ArrayList<Festival> fList = new ArrayList<Festival>();
		FestivalDao dao = FestivalDao.getInstance();
		fList = dao.getSumArea();
		return fList;
	}
	
	
	
}
