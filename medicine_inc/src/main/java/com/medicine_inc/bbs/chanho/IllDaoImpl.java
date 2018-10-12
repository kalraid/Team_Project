package com.medicine_inc.bbs.chanho;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.medicine_inc.bbs.domain.IllList;

@Repository
public class IllDaoImpl implements IllDao {

	private final String NAME_SPACE = "com.medicine_inc.bbs.mapper.ChanhoMapper";
	
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession=sqlSession;
	}

	
	
	// 질병정보를 가져와서 list로 뿌려주는 메소드 ( 매퍼 if처리로 ㄱ ㄴ ㄷ ㄹ 순으로도 가능하게, 항목분류도 가능하게)
	@Override
	public List<IllList> IllList() {

		
		return sqlSession.selectList(NAME_SPACE+".SelectIllList");
	}

	
	
}
