package com.medicine_inc.bbs.exception;

// 회원 로그인 시에 비밀번호가 맞지 않으면 발생하는 예외 처리 클래스 
public class MemberPassCheckFailException extends RuntimeException {
	private static final long serialVersionUID = 1L;

	public MemberPassCheckFailException(String message) {
		super(message);
	}
}