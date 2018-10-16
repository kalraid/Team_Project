package com.medicine_inc.bbs.domain;
public class Jiap{
	private int jiapnum;
	private String jiaptc;
	
	public void Jiap() {}
	
	public Jiap(int jiapnum, String jiaptc) {
		this.jiapnum = jiapnum;
		this.jiaptc = jiaptc;
	}

	public int getJiapnum() {
		return jiapnum;
	}

	public void setJiapnum(int jiapnum) {
		this.jiapnum = jiapnum;
	}

	public String getJiaptc() {
		return jiaptc;
	}

	public void setJiaptc(String jiaptc) {
		this.jiaptc = jiaptc;
	}

}