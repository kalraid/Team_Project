package com.playground.vo;


public class ChartMonth {

	private int acode;
	private String month;
	private int sumGood;
	
	public ChartMonth(){}

	public ChartMonth(int acode, String month, int sumGood) {
		this.acode = acode;
		this.month = month;
		this.sumGood = sumGood;
	}



	public int getAcode() {
		return acode;
	}

	public void setAcode(int acode) {
		this.acode = acode;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public int getSumGood() {
		return sumGood;
	}

	public void setSumGood(int sumGood) {
		this.sumGood = sumGood;
	}
	
	
	
}
