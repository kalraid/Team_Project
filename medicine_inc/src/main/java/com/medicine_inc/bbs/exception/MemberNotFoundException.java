package com.medicine_inc.bbs.exception;

// 회원 로그인 시에 아이디가 존재하지 않으면 발생하는 예외처리 클래스
public class MemberNotFoundException extends RuntimeException {
	private static final long serialVersionUID = 1L;

	public MemberNotFoundException(String message) {
		super(message);
	}
}
