package com.medicine_inc.bbs.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.medicine_inc.bbs.domain.*;

public class MediDaoImpl implements MediDao {

	private final String NAME_SPACE = "com.medicine.cor.mapper.MediMapper";
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public List<Medi> mediList(int no, int startRow) {
		// TODO Auto-generated method stub
		Map<String , Object> params = new HashMap<String,Object>();
		params.put("startRow", startRow);
		params.put("no", no);
		
		
		return sqlSession.selectList(NAME_SPACE +".mediList", params);
	}
	
	@Override
	public Medi getMedi(int no) {
		return null;
	}

}
