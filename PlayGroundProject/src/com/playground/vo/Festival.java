package com.playground.vo;

import java.util.Date;

public class Festival {
	private int contentId; //축제번호
	private String fePlace; //지역 (addr1)
	private String feImg1;
	private int good; //추천수
	private String tel;
	private String title; //제목
	private String xmap;//경도
	private String ymap;//위도
	private Date eventStartdate;//시작일
	private Date eventEndDate; //종료일
	private int areaCode;//지역코드
	private int dCode; //구 코드
	private String sumArea; //합친지역
	
	public Festival() { }

	public Festival(int contentId, String fePlace, String feImg1, int good, String tel, String title, String xmap,
			String ymap, Date eventStartdate, Date eventEndDate, int areaCode, int dCode, String sumArea) {
		this.contentId = contentId;
		this.fePlace = fePlace;
		this.feImg1 = feImg1;
		this.good = good;
		this.tel = tel;
		this.title = title;
		this.xmap = xmap;
		this.ymap = ymap;
		this.eventStartdate = eventStartdate;
		this.eventEndDate = eventEndDate;
		this.areaCode = areaCode;
		this.dCode = dCode;
		this.sumArea = sumArea;
	}

	public int getContentId() {
		return contentId;
	}

	public void setContentId(int contentId) {
		this.contentId = contentId;
	}

	public String getFePlace() {
		return fePlace;
	}

	public void setFePlace(String fePlace) {
		this.fePlace = fePlace;
	}

	public String getFeImg1() {
		return feImg1;
	}

	public void setFeImg1(String feImg1) {
		this.feImg1 = feImg1;
	}

	public int getGood() {
		return good;
	}

	public void setGood(int good) {
		this.good = good;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getXmap() {
		return xmap;
	}

	public void setXmap(String xmap) {
		this.xmap = xmap;
	}

	public String getYmap() {
		return ymap;
	}

	public void setYmap(String ymap) {
		this.ymap = ymap;
	}

	public Date getEventStartdate() {
		return eventStartdate;
	}

	public void setEventStartdate(Date eventStartdate) {
		this.eventStartdate = eventStartdate;
	}

	public Date getEventEndDate() {
		return eventEndDate;
	}

	public void setEventEndDate(Date eventEndDate) {
		this.eventEndDate = eventEndDate;
	}

	public int getAreaCode() {
		return areaCode;
	}

	public void setAreaCode(int areaCode) {
		this.areaCode = areaCode;
	}

	public int getdCode() {
		return dCode;
	}

	public void setdCode(int dCode) {
		this.dCode = dCode;
	}

	public String getSumArea() {
		return sumArea;
	}

	public void setSumArea(String sumArea) {
		this.sumArea = sumArea;
	}
	
}
