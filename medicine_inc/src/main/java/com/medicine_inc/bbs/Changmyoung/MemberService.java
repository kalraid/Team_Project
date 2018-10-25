package com.medicine_inc.bbs.Changmyoung;

import com.medicine_inc.bbs.domain.Member;

public abstract interface MemberService {

	
	public int login(String id, String pass);	
		
	public Member getMember(String id);
	
	// 회원 가입시 DAO를 이용해 아이디 중복을 체크하는 메서드
	public boolean overlapIdCheck(String id);
	
	// 회원 정보를 DAO를 이용해 회원 테이블에 저장하는 메서드
	public void addMember(Member member);
	
	// 회원 정보 수정 시에 기존 비밀번호가 맞는지 체크하는 메서드
	public boolean memberPassCheck(String id, String pass);
	
	// 회원 정보를 DAO를 이용해 회원 테이블에서 수정하는 메서드
	public void updateMember(Member member);
}
