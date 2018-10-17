package com.medicine_inc.bbs.haejin;

import java.util.ArrayList;
import java.util.List;

import com.medicine_inc.bbs.domain.Pharmacy;

public interface JinDao {
	
	/*현재 위치에서 반경300m 약국 구하는 메소드*/
	public abstract List<Pharmacy> radiansList(String lat, String lng);
	
	
}
