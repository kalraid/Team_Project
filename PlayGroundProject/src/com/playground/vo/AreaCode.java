package com.playground.vo;

public class AreaCode {
	
	private int code; //지역코드명
	private String name; //지역명
	
	public AreaCode() {}

	public AreaCode(int code, String name){
		this.code = code;
		this.name = name;
	}

	public int getCode(){
		return code;
	}

	public void setCode(int code){
		this.code = code;
	}

	public String getName(){
		return name;
	}

	public void setName(String name){
		this.name = name;
	}

	
}
