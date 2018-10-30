package com.medicine_inc.bbs.gugyeong;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.medicine_inc.bbs.domain.JiwonBoard;
@Service
public class JiwonBoardServiceImpl implements JiwonBoardService {
	@Autowired
	private JiwonBoardDao jiwonboardDao;
	public void setBoardDao(JiwonBoardDao jiwonboardDao) {
	this.jiwonboardDao = jiwonboardDao;
	}
	/* BoardDao를 이용해 게시판 테이블에서
	* 현재 페이지에 해당하는 게시 글 리스트를 읽어와 반환 하는 메소드
	**/
	@Override
	public List<JiwonBoard> boardList() {
	return jiwonboardDao.boardList();
	}

	@Override
	public JiwonBoard getBoard(int bno) {
		// TODO Auto-generated method stub
		return jiwonboardDao.getBoard(bno);
	}


	@Override
	public void insertBoard(JiwonBoard board) {
		// TODO Auto-generated method stub
		jiwonboardDao.insertBoard(board);

	}

	@Override
	public void updateBoard(JiwonBoard board) {
		// TODO Auto-generated method stub
		jiwonboardDao.updateBoard(board);
	}

	@Override
	public void deleteBoard(int bno) {
		// TODO Auto-generated method stub
		jiwonboardDao.deleteBoard(bno);

	}
	public boolean isPassCheck(int bno, String pass) {
		return jiwonboardDao.isPassCheck(bno, pass);
		}

}
