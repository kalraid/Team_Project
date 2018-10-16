package com.medicine_inc.bbs.chanho;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	private SqlSessionTemplate sqlSession;

	@Autowired
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	// 질병정보를 가져와서 list로 뿌려주는 메소드 ( 매퍼 if처리로 ㄱ ㄴ ㄷ ㄹ 순으로도 가능하게, 항목분류도 가능하게)
	@Override
	public List<IllList> IllList(int startRow, int pageNum, String keyword, String type) {

		// hid =1 자음검색
		// != 1 일떄 type!= "" 이면 검색기능검색
		// != 1 인데 type =="" 이면 일반접속

		Map<String, Object> params = new HashMap<String, Object>();
		params.put("startRow", startRow);
		params.put("pageNum", pageNum);
		params.put("Pas", Pas);
		System.out.println(Pas);
		if (Pas == 3) {
			params.put("first", first);
			params.put("last", last);
			System.out.println("hids = 1이고, startRow는 " + startRow + ", pageNum은" + pageNum + 
								" 이며 first는 " + first + " last는 " + last);
		} else if (Pas == 2) {
			params.put("keyword", keyword);
			System.out.println("선택된 keyword는 " + keyword + " 이며, hid는  1이고,"
					+ " startRow는 " + startRow + ", pageNum은" + pageNum + " 이며 keyword는 " + keyword);			
		} else if (Pas == 1) {
			params.put("keyword", keyword);
			params.put("type", type);
			System.out.println("선택된 keyword는 " + keyword + " 이며, hid는  1이고, type은 "+type
					+ " startRow는 " + startRow + ", pageNum은" + pageNum + " 이며 keyword는 " + keyword);

		}
		return sqlSession.selectList(NAME_SPACE + ".SelectIllList", params);
	}

	@Override
	public int getIllCount(String keyword, String type, int hid) {

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
		return sqlSession.selectOne(NAME_SPACE + ".getBoardCount", params);

	}

}
