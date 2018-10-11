package com.medicine_inc.bbs.domain;

import java.sql.Timestamp;

public class Medi {
	private int no;
	private int mediCode;
	private String mediName;
	private String mediMaker;
	private int mediEffCode;
	private String mediEff;
	private Timestamp mediPermitDate;
	private String mediDiv;
	private String mediImage;
	
	public Medi() {}
	
	public Medi(int no, int mediCode, String mediName, String mediMaker, 
			int mediEffCode, String mediEff, Timestamp mediPermitDate, String mediDiv, String mediImage ) {
		this.no = no;
		this.mediCode = mediCode;
		this.mediName = mediName;
		this.mediMaker = mediMaker;
		this.mediEffCode = mediEffCode;
		this.mediEff = mediEff;
		this.mediPermitDate = mediPermitDate;
		this.mediDiv = mediDiv;
		this.mediImage = mediImage;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getMediCode() {
		return mediCode;
	}

	public void setMediCode(int mediCode) {
		this.mediCode = mediCode;
	}

	public String getMediName() {
		return mediName;
	}

	public void setMediName(String mediName) {
		this.mediName = mediName;
	}

	public String getMediMaker() {
		return mediMaker;
	}

	public void setMediMaker(String mediMaker) {
		this.mediMaker = mediMaker;
	}

	public int getMediEffCode() {
		return mediEffCode;
	}

	public void setMediEffCode(int mediEffCode) {
		this.mediEffCode = mediEffCode;
	}

	public String getMediEff() {
		return mediEff;
	}

	public void setMediEff(String mediEff) {
		this.mediEff = mediEff;
	}

	public Timestamp getMediPermitDate() {
		return mediPermitDate;
	}

	public void setMediPermitDate(Timestamp mediPermitDate) {
		this.mediPermitDate = mediPermitDate;
	}

	public String getMediDiv() {
		return mediDiv;
	}

	public void setMediDiv(String mediDiv) {
		this.mediDiv = mediDiv;
	}

	public String getMediImage() {
		return mediImage;
	}

	public void setMediImage(String mediImage) {
		this.mediImage = mediImage;
	}
	
}
