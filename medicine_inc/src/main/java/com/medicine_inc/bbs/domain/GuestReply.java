package com.medicine_inc.bbs.domain;

import java.sql.Date;

public class GuestReply {
	private int no; //댓글번호
	private int bno; //게시판번호 
	private int btype; // 약국1, 병원2, 동물병원=3 type
	private int pass; //비밀번호로 댓글 수정, 삭제, 등록시 비밀번호 생성
	private String content; //내용
	private Date date;
	
	public GuestReply() {}
	
	public GuestReply(int no, int bno, int btype, int pass, String content, Date date) {
		super();
		this.no = no;
		this.bno = bno;
		this.btype = btype;
		this.pass = pass;
		this.content = content;
		this.date = date;
	}

	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public int getBtype() {
		return btype;
	}
	public void setBtype(int btype) {
		this.btype = btype;
	}
	
	public int getPass() {
		return pass;
	}

	public void setPass(int pass) {
		this.pass = pass;
	}

	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "GuestReply [no=" + no + ", bno=" + bno + ", btype=" + btype + ", pass=" + pass + ", content="
				+ content + ", date=" + date + "]";
	}
	
}
