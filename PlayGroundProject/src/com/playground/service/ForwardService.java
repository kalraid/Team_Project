package com.playground.service;

// Redirect 정보와 View 페이지의 경로 정보를 저장하는 클래스
public class ForwardService {
	
	/* Redirect 정보를 저장하는 변수
	 * true : Redirect, false : Forward
	 **/
	private boolean isRedirect;
	
	// View 페이지의 경로 정보를 저장하는 변수
	private String path;
	
	// View 페이지의 이름 정보를 저장할 변수
	private String page;
	
	public boolean isRedirect() {
		return isRedirect;
	}
	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}	
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public void setPath(String prefix, String suffix) {
		this.path = prefix.concat(getPage()).concat(suffix);
	}
	public String getPage() {
		return page;
	}
	public void setPage(String page) {
		this.page = page;
	}	
}
