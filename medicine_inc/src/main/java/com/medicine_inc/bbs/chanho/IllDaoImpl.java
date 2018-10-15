package com.medicine_inc.bbs.chanho;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.medicine_inc.bbs.domain.IllList;

@Repository
public class IllDaoImpl implements IllDao {
	int Pas = -1;
	String first="";
	String last ="";
	private final String NAME_SPACE = "com.medicine_inc.bbs.mapper.ChanhoMapper";
	
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession=sqlSession;
	}

	
	
	// 질병정보를 가져와서 list로 뿌려주는 메소드 ( 매퍼 if처리로 ㄱ ㄴ ㄷ ㄹ 순으로도 가능하게, 항목분류도 가능하게)
	@Override
	public List<IllList> IllList(int startRow, int pageNum,  String keyword) {

		Map<String, Object> params = new HashMap<String, Object>();
		params.put("startRow", startRow);
		params.put("pageNum", pageNum);
		params.put("Pas", Pas);
		if(Pas==1) {
		params.put("first", first);
		params.put("last", last);
		}else if(Pas==0) {
		params.put("keyword", keyword);
		}
		return sqlSession.selectList(NAME_SPACE+".SelectIllList", params);
	}



	@Override
	public int getIllCount(String keyword) {

		Map<String, Object> params = new HashMap<String, Object>();		
		
		
		Pas = -1;
		
		if(keyword!="") {
			Pas=0;
		}
		first = "";
		last = "";
		switch(keyword) {
			case "ㄱ":
				Pas=1;
				first="가";last="나";
				break;
			case "ㄴ":
				Pas=1;
				first="나";last="다";
				break;
			case "ㄷ":
				Pas=1;
				first="다";last="라";
				break;
			case "ㄹ":
				Pas=1;
				first="라";last="마";
				break;
			case "ㅁ":
				Pas=1;
				first="마";last="바";
				break;
			case "ㅂ":
				Pas=1;
				first="바";last="사";
				break;
			case "ㅅ":
				Pas=1;
				first="사";last="아";
				break;
			case "ㅇ":
				Pas=1;
				first="아";last="자";
				break;
			case "ㅈ":
				Pas=1;
				first="자";last="차";
				break;
			case "ㅊ":
				Pas=1;
				first="차";last="카";
				break;
			case "ㅋ":
				Pas=1;
				first="카";last="타";
				break;
			case "ㅌ":
				Pas=1;
				first="타";last="파";
				break;
			case "ㅍ":
				Pas=1;
				first="파";last="하";
				break;
			case "ㅎ":
				Pas=1;
				first="하";last="힣";
				break;
		}
		
		
		System.out.println("선택된 keyword는 "+ keyword+" 이며, Pas는  "+Pas);
		params.put("Pas", Pas);
		if(Pas==1) {
		params.put("first", first);
		params.put("last", last);
		}else if(Pas==0) {
		params.put("keyword", keyword);
		}
		return sqlSession.selectOne(NAME_SPACE + ".getBoardCount", params);
		
	}

	
	
}
