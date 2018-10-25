package com.medicine_inc.bbs.Changmyoung;

import com.medicine_inc.bbs.domain.Member;

public abstract interface MemberDao {
	// 로그인처리
	public int login(String id, String pass);

	public Member getMember(String id);

	// 회원 정보를 회원 테이블에 저장하는 메서드
	public void addMember(Member member);
	
	// 회원 정보 수정 시에 기존 비밀번호가 맞는지 체크하는 메서드
	public boolean memberPassCheck(String id, String pass);
	
	// 회원 정보를 회원 테이블에서 수정하는 메서드
	public void updateMember(Member member);
	
	
}
