package com.medicine_inc.bbs.haejin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.util.SystemPropertyUtils;

import com.medicine_inc.bbs.domain.AnimalHospital;
import com.medicine_inc.bbs.domain.GuestReply;
import com.medicine_inc.bbs.domain.Hospital;
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
		params.put("xpos", lat);
		params.put("ypos", lng);
		return sqlSession.selectList(NAME_SPACE + ".radiansList", params);
	}

	@Override
	public List<Hospital> radiansListHospital(String lat, String lng) {
		Map<String, String> params = new HashMap<String, String>();
		params.put("xpos", lat);
		params.put("ypos", lng);
		return sqlSession.selectList(NAME_SPACE + ".radiansListHospital", params);
	}

	@Override
	public Pharmacy getPharmacy(String no) {
		return sqlSession.selectOne(NAME_SPACE + ".getPharmacy", no);
	}

	@Override
	public Hospital getHospital(String no) {
		return sqlSession.selectOne(NAME_SPACE + ".getHospital", no);
	}

	@Override
	public void setGReply(GuestReply reply) {
		sqlSession.insert(NAME_SPACE + ".insertGreply", reply);
	}

	@Override
	public List<GuestReply> greplyList(int bno, int btype) {
		Map<String, Integer> params = new HashMap<String, Integer>();
		params.put("bno" ,bno);
		params.put("btype", btype);
		List<GuestReply> greplyList = sqlSession.selectList(NAME_SPACE +".greplyList", params);
		System.out.println("mapper에서 가져온 list : "+greplyList.size());
		return sqlSession.selectList(NAME_SPACE +".greplyList", params);
	}

	@Override
	public boolean greplyPassCheck(int no, int pass) {
		boolean result = false;
		int dbPass = sqlSession.selectOne(NAME_SPACE + ".greplyPassCheck", no);
		if(dbPass == pass) {
			result = true;
		}
		return result;
	}

	@Override
	public void deletegReply(int no) {
		sqlSession.delete(NAME_SPACE +".deletegReply", no);
	}

	@Override
	public void reUpdate(GuestReply reply) {
		sqlSession.update(NAME_SPACE +".reUpdate", reply);
	}

	@Override
	public List<Pharmacy> pSearchList(String sidoname, String name, int startRow, int num) {
		//startRow num 추가
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("sidoname", sidoname);
		params.put("name", name);
		params.put("startRow", startRow);
		params.put("num", num);
		return sqlSession.selectList(NAME_SPACE + ".pSearchList", params);
	}

	@Override
	public int pgetListCount(String sidoname, String name) {
		System.out.println("pageDaoImpl : "+ sidoname+", "+name);
		Map<String, String> params = new HashMap<String, String>();
		params.put("sidoname", sidoname);
		params.put("name", name);
		int count = sqlSession.selectOne(NAME_SPACE + ".pgetListCount", params);
		System.out.println("pageDaoImpl : "+count);
		return sqlSession.selectOne(NAME_SPACE + ".pgetListCount", params);
	}

	@Override
	public List<AnimalHospital> aniSearchList(String sidoname, String name, int startRow, int num) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("sidoname", sidoname);
		params.put("name", name);
		params.put("startRow", startRow);
		params.put("num", num);
		return sqlSession.selectList(NAME_SPACE + ".aniSearchList", params);
	}

	@Override
	public int aniSearchCount(String sidoname, String name) {
		Map<String, String> params = new HashMap<String, String>();
		params.put("sidoname", sidoname);
		params.put("name", name);
		return sqlSession.selectOne(NAME_SPACE + ".aniSearchCount", params);
	}

	@Override
	public List<Hospital> hosSearchList(String sidoname, String name, int startRow, int num, String clcdname, String classification) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("sidoname", sidoname);
		params.put("name", name);
		params.put("startRow", startRow);
		params.put("num", num);
		params.put("clcdname", clcdname);
		params.put("classification", classification);
		System.out.println("검색명s : "+clcdname+",  "+classification);
		return sqlSession.selectList(NAME_SPACE + ".hosSearchList", params);
	}

	@Override
	public int hosSearchCount(String sidoname, String name, String clcdname, String classification) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("sidoname", sidoname);
		params.put("name", name);
		params.put("clcdname", clcdname);
		params.put("classification", classification);
		System.out.println("검색명s : "+clcdname+",  "+classification);
		return sqlSession.selectOne(NAME_SPACE + ".hosSearchCount", params);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
