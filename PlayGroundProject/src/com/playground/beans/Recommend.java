package com.playground.beans;

import java.sql.Timestamp;



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
	private String file;
	private int recommend; // 추천수인데 DB에서는 컬럼이름이 good2;
	private int thank;
	
	
	public Recommend() {
	
	}
	
	
	
	public Recommend(int no, String linklist, String id, String gesimul, int tableNum, String people, Timestamp dbdate,
			String good, String pass, String file, int recommend, int thank) {
		this.no = no;
		this.linklist = linklist;
		this.id = id;
		this.gesimul = gesimul;
		this.tableNum = tableNum;
		this.people = people;
		this.dbdate = dbdate;
		this.good = good;
		this.pass = pass;
		this.file = file;
		this.recommend = recommend;
		this.thank = thank;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getLinklist() {
		return linklist;
	}
	public void setLinklist(String linklist) {
		this.linklist = linklist;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	
	
	public String getFile() {
		return file;
	}



	public void setFile(String file) {
		this.file = file;
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
