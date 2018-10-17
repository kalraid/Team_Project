package com.medicine_inc.bbs.haejin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.medicine_inc.bbs.domain.Pharmacy;

@Repository
public class JinDaoImpl implements JinDao{

	private final String NAME_SPACE = "com.medicine_inc.bbs.mapper.HaejinMapper";
	
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public List<Pharmacy> radiansList(String lat, String lng) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("lat", lat);
		params.put("lng", lng);
		
		return sqlSession.selectList(NAME_SPACE + ".radiansList", params);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
