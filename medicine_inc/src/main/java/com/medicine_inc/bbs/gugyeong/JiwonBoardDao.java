package com.medicine_inc.bbs.gugyeong;

import java.util.List;

import com.medicine_inc.bbs.domain.JiwonBoard;

public interface JiwonBoardDao {

		/* 한 페이지에 보여 질 게시 글 리스트 요청 시 호출되는 메소드
		* 현재 페이지에 해당하는 게시 글 리스트를 DB에서 읽어와 반환 하는 메소드
		**/
		public abstract List<JiwonBoard> boardList();
		/* 게시 글 상세보기 요청 시 호출되는 메서드
		* no에 해당하는 게시 글 을 DB에서 읽어와 Board 객체로 반환 하는 메서드
		**/
		public abstract JiwonBoard getBoard(int bno);
		/* 게시 글쓰기 요청 시 호출되는 메서드
		* 게시 글쓰기 요청 시 게시 글 내용을 Board 객체로 받아 DB에 추가하는 메서드
		**/
		public abstract void insertBoard(JiwonBoard board);
		/* 게시 글 수정, 삭제 시 비밀번호 입력을 체크하는 메서드
		*
		* - 게시 글의 비밀번호가 맞으면 : true를 반환
		* - 게시 글의 비밀번호가 맞지 않으면 : false를 반환
		**/
		public boolean isPassCheck(int bno, String pass);
		/* 게시 글 수정 요청 시 호출되는 메서드
		* 게시 글 수정 요청 시 수정된 내용을 Board 객체로 받아 DB에 수정하는 메서드
		**/
		public abstract void updateBoard(JiwonBoard board);
		/* 게시 글 삭제 요청 시 호출되는 메서드
		* no에 해당 하는 게시 글을 DB에서 삭제하는 메서드
		**/
		public abstract void deleteBoard(int bno);
		
		public abstract List<JiwonBoard> boardList(int startRow, int num);
		
		public abstract int getBoardCount();



}
