package com.medicine_inc.bbs.domain;

public class Pharmacy {
	
	private int no; //sequence
	private String name; //약국명
	private String addr; //주소
	private int post; //post번호
	private int sgucd; //구 코드
	private String sguname; //구이름
	private int sido; //시 코드
	private String sidoname; //시이름
	private String tel; //전화번호
	private String xpos; //위도
	private String ypos; //경도
	
	public Pharmacy() {}
	
	public Pharmacy(String name, String addr, int post, int sgucd, String sguname,
			int sido, String sidoname, String tel, String xpos, String ypos) {
		this.name = name;
		this.addr = addr;
		this.post = post;
		this.sgucd = sgucd;
		this.sguname = sguname;
		this.sido = sido;
		this.sidoname = sidoname;
		this.tel = tel;
		this.xpos = xpos;
		this.ypos = ypos;
	}

	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
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

	public int getPost() {
		return post;
	}
	public void setPost(int post) {
		this.post = post;
	}
	public int getSgucd() {
		return sgucd;
	}
	public void setSgucd(int sgucd) {
		this.sgucd = sgucd;
	}
	public String getSguname() {
		return sguname;
	}
	public void setSguname(String sguname) {
		this.sguname = sguname;
	}
	public int getSido() {
		return sido;
	}
	public void setSido(int sido) {
		this.sido = sido;
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

	@Override
	public String toString() {
		return "Pharmacy [no=" + no + ", name=" + name + ", addr=" + addr + 
				", post=" + post + ", sgucd=" + sgucd + ", sguname=" + sguname + ", sido=" + sido + ", sidoname="
				+ sidoname + ", tel=" + tel + ", xpos=" + xpos + ", ypos=" + ypos + "]";
	}
	
	
}
