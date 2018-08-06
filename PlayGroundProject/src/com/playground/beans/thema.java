package com.playground.beans;

public class thema {
	private String s_themaName;
	private int s_themaNum;
	private int themaNum;
	private String themaName;

	
	public thema() {
	};

	public thema(int themaNum, String themaName) {
		this.themaNum = themaNum;
		this.themaName = themaName;
	};
	
	public thema(String s_themaName, int themaNum, String themaName, int s_themaNum) {
		this.s_themaName = s_themaName;
		this.themaNum = themaNum;
		this.themaName = themaName;
		this.s_themaNum = s_themaNum;
	};

	
	public int getS_themaNum() {
		return s_themaNum;
	}

	public void setS_themaNum(int s_themaNum) {
		this.s_themaNum = s_themaNum;
	}

	
	public String getS_themaName() {
		return s_themaName;
	}

	public void setS_themaName(String s_themaName) {
		this.s_themaName = s_themaName;
	}

	public int getThemaNum() {
		return themaNum;
	}

	public void setThemaNum(int themaNum) {
		this.themaNum = themaNum;
	}

	public String getThemaName() {
		return themaName;
	}

	public void setThemaName(String themaName) {
		this.themaName = themaName;
	}
	
	
}
