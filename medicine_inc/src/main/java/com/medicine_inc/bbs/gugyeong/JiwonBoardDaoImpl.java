package com.medicine_inc.bbs.gugyeong;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.stereotype.Repository;

import com.medicine_inc.bbs.domain.JiwonBoard;

@Repository
public class JiwonBoardDaoImpl implements JiwonBoardDao {

	private final String NAME_SPACE = "com.medicine_inc.bbs.mapper.KookyeongMapper";

	private SqlSessionTemplate sqlSession;

	@Autowired
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<JiwonBoard> jiwonBoardList(int startRow, int num) {
		Map<String, Integer> params = new HashMap<String, Integer>();
		params.put("startRow", startRow);
		params.put("num", num);
		return sqlSession.selectList(NAME_SPACE + ".jiwonBoardList", params);
	}

	@Override
	public int getBoardCount() {
		return sqlSession.selectOne(NAME_SPACE + ".getBoardCount");
	}

	@Override
	public void jiwonInsertBoard(JiwonBoard jiwonBoard) {
		sqlSession.insert(NAME_SPACE + ".jiwonInsertBoard", jiwonBoard);
	}

	public boolean isPassCheck(int bno, String pass) {
		boolean result = false;
		String dbPass = sqlSession.selectOne(NAME_SPACE + ".isPassCheck", bno);
		if (dbPass.equals(pass)) {
			result = true;
		}
		return result;

	}

	@Override
	public JiwonBoard getJiwonBoard(int bno, boolean isCount) {
		if (isCount) {
			sqlSession.update(NAME_SPACE + ".incrementReadCount", bno);
		}
		return sqlSession.selectOne(NAME_SPACE + ".getJiwonBoard", bno);
	}

	@Override
	public void updateBoard(JiwonBoard jiwonBoard) {
		sqlSession.update(NAME_SPACE + ".updateBoard", jiwonBoard);
	}

	@Override
	public void deleteBoard(int bno) {
		// deleteBoard 맵핑 구문을 호출하면서 no를 파라미터로 지정했다.
		sqlSession.delete(NAME_SPACE + ".deleteBoard", bno);
	}

}
