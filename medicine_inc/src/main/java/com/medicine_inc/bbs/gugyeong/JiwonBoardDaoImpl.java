package com.medicine_inc.bbs.gugyeong;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.medicine_inc.bbs.domain.JiwonBoard;

@Repository
public class JiwonBoardDaoImpl implements JiwonBoardDao {

	/*
	 * src/main/resources/repository/mappers/BoardMapper.xml에 정의한 Mapper namespace를
	 * 상수로 정의
	 **/
	private final String NAME_SPACE = "com.medicine_inc.bbs.mapper.KookyeongMapper";

	private SqlSessionTemplate sqlSession;

	@Autowired
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<JiwonBoard> boardList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAME_SPACE + ".boardList");
	}

	@Override
	public JiwonBoard getBoard(int bno) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAME_SPACE + ".getBoard", bno);
	}

	@Override
	public void insertBoard(JiwonBoard board) {

		sqlSession.insert(NAME_SPACE + ".insertBoard", board);
	}

	@Override
	public boolean isPassCheck(int bno, String pass) {
		boolean result = false;
		// isPassCheck 맵핑 구문을 호출하면서 게시 글 번호인 no를 파라미터로 지정했다.
		String dbPass = sqlSession.selectOne(
		NAME_SPACE + ".isPassCheck", bno);
		// 비밀번호가 맞으면 true가 반환된다.
		if(dbPass.equals(pass)) {
		result = true;
		}
		return result;
	}

	@Override
	public void updateBoard(JiwonBoard board) {
		// updateBoard 맵핑 구문을 호출하면서 Board 객체를 파라미터로 지정했다.
		sqlSession.update(NAME_SPACE + ".updateBoard", board);

	}

	@Override
	public void deleteBoard(int bno) {
		// TODO Auto-generated method stub
		// deleteBoard 맵핑 구문을 호출하면서 no를 파라미터로 지정했다.
		sqlSession.delete(NAME_SPACE + ".deleteBoard", bno);

	}

	@Override
	public List<JiwonBoard> boardList(int startRow, int num) {
		// TODO Auto-generated method stub
		Map<String, Integer> params = new HashMap<String, Integer>();
		params.put("startRow", startRow);
		params.put("num", num);
		return sqlSession.selectList(NAME_SPACE + ".boardList", params);
	}

	@Override
	public int getBoardCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAME_SPACE + ".getBoardCount");
	}
	

}
