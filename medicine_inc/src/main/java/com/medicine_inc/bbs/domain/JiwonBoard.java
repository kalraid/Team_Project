package com.medicine_inc.bbs.domain;

import java.sql.Timestamp;

public class JiwonBoard {

	private int bno;
	private String title;
	private String content;
	private String writer;
	private Timestamp regDate;
	private int viewcnt;
	private String pass;
	private int recommend;
	private int thank;

	public JiwonBoard() {
	}

	public JiwonBoard(int bno, String title, String content, String writer, Timestamp regDate, int viewcnt, String pass) {
		this.bno = bno;
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.regDate = regDate;
		this.viewcnt = viewcnt;
		this.pass = pass;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public Timestamp getRegDate() {
		return regDate;
	}

	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}

	public int getViewcnt() {
		return viewcnt;
	}

	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public int getRecommend() {
		return recommend;
	}

	public void setRecommend(int recommend) {
		this.recommend = recommend;
	}

	public int getThank() {
		return thank;
	}

	public void setThank(int thank) {
		this.thank = thank;
	}

	
}
