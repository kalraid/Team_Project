package com.playground.beans;

import java.sql.Timestamp;

public class ProjectReply {
	private int no;
	private int projectNo;
	private String projectreply;
	private String projectwriter;
	private Timestamp projectdbdate;

	public ProjectReply() {}
	
	public ProjectReply(int projectNo , String projectreply, String projectwriter) {
		this.projectNo = projectNo; // 히든넘버
		this.projectreply = projectreply; // 작성자
		this.projectwriter = projectwriter; // 내용
		
	}
	
	
	public ProjectReply(int no, int projectNo, String projectreply , String projectwriter , Timestamp projectdbdate ) {
		this.no = no;
		this.projectNo = projectNo; // 히든넘버
		this.projectreply = projectreply;  //  내용
		this.projectwriter = projectwriter; // 작성자
		this.projectdbdate = projectdbdate;
		
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getProjectNo() {
		return projectNo;
	}

	public void setProjectNo(int projectNo) {
		this.projectNo = projectNo;
	}

	public String getProjectreply() {
		return projectreply;
	}

	public void setProjectreply(String projectreply) {
		this.projectreply = projectreply;
	}

	public String getProjectwriter() {
		return projectwriter;
	}

	public void setProjectwriter(String projectwriter) {
		this.projectwriter = projectwriter;
	}

	public Timestamp getProjectdbdate() {
		return projectdbdate;
	}

	public void setProjectdbdate(Timestamp projectdbdate) {
		this.projectdbdate = projectdbdate;
	}
	
}
