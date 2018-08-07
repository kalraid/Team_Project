package com.playground.beans;

import java.sql.Timestamp;

public class RecommendReyply {
	private int no;
	private int recommendNo;
	private String recommendreply;
	private String recommendwriter;
	private Timestamp recommenddbdate;

	public RecommendReyply() {}
	
	public RecommendReyply(int recommendNo , String recommendreply, String recommendwriter) {
		this.recommendNo = recommendNo; // 히든넘버
		this.recommendreply = recommendreply; // 작성자
		this.recommendwriter = recommendwriter; // 내용
		
	}
	
	
	public RecommendReyply(int no, int recommendNo, String recommendreply , String recommendwriter , Timestamp recommenddbdate ) {
		this.no = no;
		this.recommendNo = recommendNo; // 히든넘버
		this.recommendreply = recommendreply;  //  내용
		this.recommendwriter = recommendwriter; // 작성자
		this.recommenddbdate = recommenddbdate;
		
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getRecommendNo() {
		return recommendNo;
	}

	public void setRecommendNo(int recommendNo) {
		this.recommendNo = recommendNo;
	}

	public String getRecommendreply() {
		return recommendreply;
	}

	public void setRecommendreply(String recommendreply) {
		this.recommendreply = recommendreply;
	}

	public String getRecommendwriter() {
		return recommendwriter;
	}

	public void setRecommendwriter(String recommendwriter) {
		this.recommendwriter = recommendwriter;
	}

	public Timestamp getRecommenddbdate() {
		return recommenddbdate;
	}

	public void setRecommenddbdate(Timestamp recommenddbdate) {
		this.recommenddbdate = recommenddbdate;
	}

	
	
}
