package com.medicine_inc.bbs.domain;

//import java.sql.Timestamp;

/* 한 명의 회원 정보를 저장하는 클래스(VO, Beans, DTO)
 * 회원 정보를 저장하고 있는 테이블의 필드와 1:1 맵핑되는 Domain 클래스
 **/
public class Member {	
	
	private String id, name, pass, email;
/*	private String phone, zipcode, address1, address2;
	private boolean  emailGet;
	private Timestamp regDate;*/	
	private boolean  isAdmin;
	
	public Member() { }

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public boolean isAdmin() {
		return isAdmin;
	}

	public void setAdmin(boolean isAdmin) {
		this.isAdmin = isAdmin;
	}	
	
	
	
}
