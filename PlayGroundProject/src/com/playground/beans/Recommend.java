package com.playground.beans;

import java.sql.Timestamp;

/*
/ no NUMBER PRIMARY KEY, --번호
people VARCHAR2(3 CHAR), -- 작성자
Linklist VARCHAR2(100 CHAR), -- 제목
Gesimul VARCHAR2(500 CHAR), -- 게시물 내용
Tablenum NUMBER, -- 테이블 번호 1 번은 일반게시판 2번은 추천게시판
Dbdate VARCHAR2(15 CHAR),-- 날짜
Good NUMBER --조회수/*/

public class Recommend {
	private int no; // 게시물 번호 1
	private String linklist; // 제목 2
	private String id; // 아이디
	private String gesimul; // 게시물 내용 3
	private int tableNum; // 테이블 번호 4
	private String people; // 작성자 5
	private Timestamp dbdate; // 날짜 6
	private String good; // 조회수
	private String pass; // 비밀번호
	private String File1;
	private int recommend; // 추천수인데 DB에서는 컬럼이름이 good2;
	private int thank; 
	
	
	public Recommend(){}
	
	public Recommend(int no , String id , String linklist, String gesimul, int tableNum,String people,Timestamp dbdate,String good,String File1, int recommend , int thank) {
		this.no = no;
		this.id = id;
		this.gesimul = gesimul;
		this.linklist = linklist;
		this.gesimul = gesimul;
		this.tableNum =tableNum;
		this.people = people;
		this.dbdate = dbdate;
		this.good = good;
		this.File1 = File1;
		this.recommend = recommend;
		this.thank = thank;
		
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	

	public String getLinklist() {
		return linklist;
	}

	public void setLinklist(String linklist) {
		this.linklist = linklist;
	}

	public String getGesimul() {
		return gesimul;
	}

	public void setGesimul(String gesimul) {
		this.gesimul = gesimul;
	}

	public int getTableNum() {
		return tableNum;
	}

	public void setTableNum(int tableNum) {
		this.tableNum = tableNum;
	}

	public String getPeople() {
		return people;
	}

	public void setPeople(String people) {
		this.people = people;
	}
	

	public Timestamp getDbdate() {
		return dbdate;
	}

	public void setDbdate(Timestamp dbdate) {
		this.dbdate = dbdate;
	}

	public String getGood() {
		return good;
	}

	public void setGood(String good) {
		this.good = good;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getFile1() {
		return File1;
	}

	public void setFile1(String file) {
		File1 = file;
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
