package com.medicine_inc.bbs.kyungmin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.medicine_inc.bbs.domain.Jiap;

@Repository
public class JiapDaoImpl implements JiapDao {

	private final String NAME_SPACE = "com.medicine_inc.bbs.mapper.ParkKyoungminMapper";
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	@Override
	public List<Jiap> jiapList(int startRow, int num) {
		
		Map<String, Integer> params = new HashMap<String, Integer>();
		params.put("startRow", startRow);
		params.put("num", num);
		return sqlSession.selectList(NAME_SPACE + ".jiapList",params);
	}
	
	@Override
	public int getJiapCount() {
	return sqlSession.selectOne(NAME_SPACE + ".getJiapCount");
	}

}
