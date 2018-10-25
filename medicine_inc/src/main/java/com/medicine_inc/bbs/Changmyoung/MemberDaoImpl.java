package com.medicine_inc.bbs.Changmyoung;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.medicine_inc.bbs.domain.Member;


@Repository
public class MemberDaoImpl implements MemberDao {

	private SqlSessionTemplate sqlSession;
	private final String NAME_SPACE = "com.medicine_inc.bbs.mapper.Changmyoung";
	
	@Autowired
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public int login(String id, String pass) {
	
		Member m = sqlSession.selectOne(NAME_SPACE + ".login", id);
		int result = -1;		
		
		// id가 존재하지 않으면
		if(m == null) {
			return result;
		} 
		
		// 로그인 성공
		if(m.getPass().equals(pass)) {
			result = 1;
		
		// 비밀번호가 틀리면	
		} else {
			result = 0;
		}
		return result;
	}
	
	// member 테이블에서 id에 해당하는 회원 정보를 읽어오는 메서드 
	@Override
	public Member getMember(String id) {
		return sqlSession.selectOne(NAME_SPACE + ".getMember", id);
	}
	
	// 회원 정보를 회원 테이블에 저장하는 메서드
	@Override
	public void addMember(Member member) {
		sqlSession.insert(NAME_SPACE + ".addMember", member);
	}
	
	// 회원 정보 수정 시에 기존 비밀번호가 맞는지 체크하는 메서드
	public boolean memberPassCheck(String id, String pass) {
		boolean result = false;
		
		// memberPassCheck 맵핑 구문을 호출하면서 회원 아이디를 파라미터로 지정했다.
		String dbPass = sqlSession.selectOne(
				NAME_SPACE + ".memberPassCheck",	id);

		// 비밀번호가 맞으면 true가 반환된다.
		if(dbPass.equals(pass)) {
			result = true;	
		}
		return result;
	}
	
	// 회원 정보를 DAO를 이용해 회원 테이블에서 수정하는 메서드
	public void updateMember(Member member) {
		sqlSession.update(NAME_SPACE + ".updateMember",	member);
	}
}
