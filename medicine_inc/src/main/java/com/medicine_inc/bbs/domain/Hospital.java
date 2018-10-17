package com.medicine_inc.bbs.domain;

public class Hospital {
	private int clcd;
	private String clcdname;
	private String sguname;
	private String sidoname; 
	private String tel;
	private String xpos;
	private String ypos;
	private String name;
	private String addr;
	private String hosurl;
	private int post;
	
	public Hospital() {}

	public Hospital(int clcd, String clcdname, String sguname, String sidoname, String tel, String xpos, String ypos,
			String name, String addr, String hosurl, int post) {
		super();
		this.clcd = clcd;
		this.clcdname = clcdname;
		this.sguname = sguname;
		this.sidoname = sidoname;
		this.tel = tel;
		this.xpos = xpos;
		this.ypos = ypos;
		this.name = name;
		this.addr = addr;
		this.hosurl = hosurl;
		this.post = post;
	}

	public int getClcd() {
		return clcd;
	}

	public void setClcd(int clcd) {
		this.clcd = clcd;
	}

	public String getClcdname() {
		return clcdname;
	}

	public void setClcdname(String clcdname) {
		this.clcdname = clcdname;
	}

	public String getSguname() {
		return sguname;
	}

	public void setSguname(String sguname) {
		this.sguname = sguname;
	}

	public String getSidoname() {
		return sidoname;
	}

	public void setSidoname(String sidoname) {
		this.sidoname = sidoname;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getXpos() {
		return xpos;
	}

	public void setXpos(String xpos) {
		this.xpos = xpos;
	}

	public String getYpos() {
		return ypos;
	}

	public void setYpos(String ypos) {
		this.ypos = ypos;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getHosurl() {
		return hosurl;
	}

	public void setHosurl(String hosurl) {
		this.hosurl = hosurl;
	}

	public int getPost() {
		return post;
	}

	public void setPost(int post) {
		this.post = post;
	}

	@Override
	public String toString() {
		return "Hospital [clcd=" + clcd + ", clcdname=" + clcdname + ", sguname=" + sguname + ", sidoname=" + sidoname
				+ ", tel=" + tel + ", xpos=" + xpos + ", ypos=" + ypos + ", name=" + name + ", addr=" + addr
				+ ", hosurl=" + hosurl + ", post=" + post + "]";
	}
	
	
}
