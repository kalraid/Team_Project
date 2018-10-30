package com.medicine_inc.bbs.gugyeong;

import java.util.List;

import com.medicine_inc.bbs.domain.JiwonBoard;

public interface JiwonBoardService {
/* BoardDao를 이용해 게시판 테이블에서
* 현재 페이지에 해당하는 게시 글 리스트를 읽어와 반환 하는 메소드
**/
public abstract List<JiwonBoard> boardList();
/* BoardDao를 이용해 게시판 테이블에서
* no에 해당하는 게시 글 을 읽어와 반환하는 메서드
**/
public abstract JiwonBoard getBoard(int bno);
// BoardDao를 이용해 새로운 게시 글을 추가하는 메서드
public abstract void insertBoard(JiwonBoard board);
// BoardDao를 이용해 게시 글을 수정하는 메서드
public abstract void updateBoard(JiwonBoard board);
// BoardDao를 이용해 no에 해당하는 게시 글을 삭제하는 메서드

public abstract void deleteBoard(int bno);
public abstract boolean isPassCheck(int bno, String pass);

}