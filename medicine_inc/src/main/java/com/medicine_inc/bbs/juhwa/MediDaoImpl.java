package com.medicine_inc.bbs.juhwa;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.medicine_inc.bbs.domain.*;

@Repository
public class MediDaoImpl implements MediDao {

	private final String NAME_SPACE = "com.medicine_inc.bbs.mapper.JuMapper";
	private SqlSessionTemplate sqlSession;
	
	
	@Autowired
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public List<Medi> mediList(int startRow, int num, String mediCode, String mediName, String mediEff, String mediMaker) {
		// TODO Auto-generated method stub
		Map<String , Object> params = new HashMap<String, Object>();
		params.put("startRow", startRow);
		params.put("num", num);
		params.put("mediCode", mediCode);
		params.put("mediName", mediName);
		params.put("mediEff", mediEff); 
		params.put("mediMaker", mediMaker);
		
		System.out.println(mediCode+","+mediEff);
		
		int search = 0;
		if(mediCode != null) {
			search = 1;
		}else if(mediCode ==null) {
			search =0;
		}
		
		params.put("search", search);
		
		
		return sqlSession.selectList(NAME_SPACE +".mediList", params);
	}
	
	@Override
	public int getMediCount(String mediCode, String mediName, String mediEff, String mediMaker) {
		
		Map<String , String> params = new HashMap<String, String>();
		params.put("mediCode", mediCode);
		params.put("mediName", mediName);
		params.put("mediEff", mediEff);
		params.put("mediMaker", mediMaker);
		
		String search = "not";
		if(mediCode!=null) {
			search = "pass";
		}
		params.put("search", search);
		System.out.println(String.valueOf(search));
		return  sqlSession.selectOne(NAME_SPACE +".getMediCount", params);
	}
	
	@Override
	public Medi getMedi(int no) {
		return sqlSession.selectOne(NAME_SPACE +".getMedi", no);
	}
	
	@Override
	public List<Medi> mediList2(int startRow, int num){
		Map<String , Object> params = new HashMap<String, Object>();
		params.put("startRow", startRow);
		params.put("num", num);
		
		return sqlSession.selectList(NAME_SPACE +".mediList2",params);
	};
	
	@Override
	public int getMediCount2() {
		
		return sqlSession.selectOne(NAME_SPACE +".getMediCount");
	};
}
