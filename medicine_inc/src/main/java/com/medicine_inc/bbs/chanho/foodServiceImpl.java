package com.medicine_inc.bbs.chanho;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.medicine_inc.bbs.domain.food;

@Service
public class foodServiceImpl implements foodService {

	@Autowired
	private foodDao foodDao;
	
	public void setFoodDao(foodDao foodDao) {
		this.foodDao = foodDao;
	}
	
	@Override
	public List<food> foodList() {
		return foodDao.getList();
		
	}


	

}
