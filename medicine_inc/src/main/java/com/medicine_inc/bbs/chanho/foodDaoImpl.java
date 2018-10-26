package com.medicine_inc.bbs.chanho;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.medicine_inc.bbs.domain.food;

@Repository
public class foodDaoImpl implements foodDao {

	private final String NAME_SPACE = "com.medicine_inc.bbs.mapper.ChanhoMapper";

	@Autowired
	private SqlSessionTemplate sqlSession;

	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public List<food> getList() {

		Map<String, Object> params = new HashMap<String, Object>();
		return sqlSession.selectList(NAME_SPACE + ".getFoodList", params);
	}

}
