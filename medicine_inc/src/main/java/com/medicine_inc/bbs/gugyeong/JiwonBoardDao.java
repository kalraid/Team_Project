package com.medicine_inc.bbs.gugyeong;

import java.util.List;

import com.medicine_inc.bbs.domain.JiwonBoard;

public interface JiwonBoardDao {
	public abstract List<JiwonBoard> jiwonBoardList(int startRow, int num);
	
	public abstract int getBoardCount();
	
	public abstract void jiwonInsertBoard(JiwonBoard jiwonBoard);
	
	public boolean isPassCheck(int bno, String pass);
	
	public abstract JiwonBoard getJiwonBoard(int bno, boolean isCount);

	public abstract void updateBoard(JiwonBoard jiwonBoard);

	public abstract void deleteBoard(int bno);
}
