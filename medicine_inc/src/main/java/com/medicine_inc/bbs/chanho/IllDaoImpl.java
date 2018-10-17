package com.medicine_inc.bbs.chanho;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.medicine_inc.bbs.domain.IllList;

@Repository
public class IllDaoImpl implements IllDao {
	int Pas;
	String first;
	String last;
	private final String NAME_SPACE = "com.medicine_inc.bbs.mapper.ChanhoMapper";

	@Autowired
	private SqlSessionTemplate sqlSession;

	public IllDaoImpl() {};
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	// 질병정보를 가져와서 list로 뿌려주는 메소드 ( 매퍼 if처리로 ㄱ ㄴ ㄷ ㄹ 순으로도 가능하게, 항목분류도 가능하게)
	@Override
	public List<IllList> IllList(int startRow, int PAGE_SIZE, String keyword, String type) {

		// Pas = 1 검색기능 검색
		// Pas = 2 일떄 영어 / 숫자 초성검색(버튼)
		// Pas = 3 한글 자음 검색(버튼)

		Map<String, Object> params = new HashMap<String, Object>();
		params.put("startRow", startRow);
		params.put("PAGE_SIZE", PAGE_SIZE);
		params.put("Pas", Pas);
		if (Pas == 3) {
			params.put("first", first);
			params.put("last", last);
		} else if (Pas == 2) {
			params.put("keyword", keyword);
		} else if (Pas == 1) {
			params.put("keyword", keyword);
			params.put("type", type);

		}
		return sqlSession.selectList(NAME_SPACE + ".SelectIllList", params);
	}

	@Override
	public int getIllCount(String keyword, String type, int hid, int startRow, int PAGE_SIZE) {
				Map<String, Object> params = new HashMap<String, Object>();
		Pas=0;
		first = "";
		last = "";
		String[] kor = new String[] { "ㄱ", "ㄴ", "ㄷ", "ㄹ", "ㅁ", "ㅂ", "ㅅ", "ㅇ", "ㅈ", "ㅊ", "ㅋ", "ㅌ", "ㅍ", "ㅎ" };
		String[] kor2 = new String[] { "가", "나", "다", "라", "마", "바", "사", "아", "자", "차", "카", "타", "파", "하", "힣" };

		if (hid == 2) {
			if (Arrays.asList(kor).contains(keyword) == true) {
				int index = Arrays.asList(kor).indexOf(keyword);
				first = kor2[index];
				last = kor2[index + 1];
				params.put("first", first);
				params.put("last", last);
				Pas=3;
			}else {
			Pas=2;
			}
		} else if (hid == 1) {
			params.put("type", type);
			Pas=1;
		}
		params.put("Pas", Pas);
		params.put("keyword", keyword);
		params.put("startRow", startRow);
		params.put("PAGE_SIZE", PAGE_SIZE);
				
		return sqlSession.selectOne(NAME_SPACE + ".getBoardCount", params);
	}

	@Override
	public IllList IllListDetail(int code) {
		
		
		return sqlSession.selectOne(NAME_SPACE + ".selectOneIlllist", code);
	}

}
