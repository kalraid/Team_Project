package com.medicine_inc.bbs.aehee;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.medicine_inc.bbs.domain.HealthSupport;

@Repository
public class HealthSupportDaoImpl implements HealthSupportDao {
	private final String NAME_SPACE = "com.medicine_inc.bbs.mapper.AeheeMapper";
	
	
	private SqlSessionTemplate sqlSession;
		
	
	@Autowired
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}	
	
	@Override
	public List<HealthSupport> boardList(int startRow, int num, int cateCode, String type, String keyword) {
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("startRow", startRow);
		params.put("num", num);
		params.put("cateCode", cateCode);		
		
		return sqlSession.selectList(NAME_SPACE + ".boardList", params);
	}
	
	@Override
	public List<HealthSupport> boardList(int startRow, int num, int cateCode) {
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("startRow", startRow);
		params.put("num", num);
		params.put("cateCode", cateCode);		
		
		return sqlSession.selectList(NAME_SPACE + ".boardList", params);
	}

	
	
	
	@Override
	public int getBoardCount(int cateCode, String type, String keyword) {
		System.out.println(cateCode);
		return sqlSession.selectOne(NAME_SPACE + ".getBoardCount", cateCode);
	}
	
	@Override
	public int getBoardCount(int cateCode) {
		System.out.println("DaoImpl.getBoardCount() : " + cateCode);
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("cateCode", cateCode);	
		return sqlSession.selectOne(NAME_SPACE + ".getBoardCount", params);
	}

	// 카테고리별 상품 개수를 Map으로 가져오는 메서드
	public Map<String, Map> cateCodeCountMap() {
		System.out.println("DaoImpl.cateCodeCountMap() : ");			
		return sqlSession.selectMap(NAME_SPACE + ".cateCodeCountMap", "cateCode");
	}
	
	
	/* 게시 글쓰기 요청 시 호출되는 메서드
	 * 게시 글쓰기 요청 시 게시 글 내용을 Board 객체로 받아 DB에 추가하는 메서드 
	 **/

	@Override
	public HealthSupport getBoard(int no) {
		return sqlSession.selectOne(NAME_SPACE + ".getBoard", no);
	}
	
	
	@Override
	public void insertBoard(HealthSupport healthSupport) {
		System.out.println(1);
		// insertBoard 맵핑 구문을 호출하면서 Board 객체를 파라미터로 지정했다.
		sqlSession.insert(NAME_SPACE + ".insertBoard", healthSupport);
	}
	
	/* 게시 글 수정, 삭제 시 비밀번호 입력을 체크하는 메서드
	 * 
	 * - 게시 글의 비밀번호가 맞으면 : true를 반환
	 * - 게시 글의 비밀번호가 맞지 않으면 : false를 반환
	 **/
	public boolean isPassCheck(int no, String pass) {	

		boolean result = false;
		
		// isPassCheck 맵핑 구문을 호출하면서 게시 글 번호인 no를 파라미터로 지정했다.
		String dbPass = sqlSession.selectOne(
				NAME_SPACE + ".isPassCheck",	no);

		// 비밀번호가 맞으면 true가 반환된다.
		if(dbPass.equals(pass)) {
			result = true;		
		}
		return result;
	}
	
	/* 게시 글 수정 요청 시 호출되는 메서드
	 * 게시 글 수정 요청 시 수정된 내용을 Board 객체로 받아 DB에 수정하는 메서드 
	 **/
	@Override
	public void updateBoard(HealthSupport healthSupport) {
		
		// updateBoard 맵핑 구문을 호출하면서 Board 객체를 파라미터로 지정했다.
		sqlSession.update(NAME_SPACE + ".updateBoard", healthSupport);
	}

	/* 게시 글 삭제 요청 시 호출되는 메서드 
	 * no에 해당 하는 게시 글을 DB에서 삭제하는 메서드 
	 **/
	@Override
	public void deleteBoard(int no) {
		
		// deleteBoard 맵핑 구문을 호출하면서 no를 파라미터로 지정했다.
		sqlSession.delete(NAME_SPACE + ".deleteBoard", no);
	}
}
