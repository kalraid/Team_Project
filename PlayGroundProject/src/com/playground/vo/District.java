package com.playground.vo;

public class District {
	
	private int no;
	private int area_code;
	private int code;
	private String name;
	
	public District(){}

	public District(int no, int area_code, int code, String name) {
		this.no = no;
		this.area_code = area_code;
		this.code = code;
		this.name = name;
	}
	

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getArea_code() {
		return area_code;
	}

	public void setArea_code(int area_code) {
		this.area_code = area_code;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}


	
	
	
	
	
}
