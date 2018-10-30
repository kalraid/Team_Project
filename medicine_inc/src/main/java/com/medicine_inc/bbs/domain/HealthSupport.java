package com.medicine_inc.bbs.domain;



public class HealthSupport {	
	private int no;
	private String name;
	private int consumerPrice;
	private int sellingPrice;
	private String capacity;
	private String shape;
	private String image;	
	private String bigImage;		
	private int cateCode;
	private String explanation;
	
	public HealthSupport() { }
	public HealthSupport(int no, String name, int consumerPrice, int sellingPrice,
			String capacity, String shape, String image, String bigImage, int cateCode, String explanation) {
		this.no = no;
		this.name = name;
		this.consumerPrice = consumerPrice;
		this.sellingPrice = sellingPrice;
		this.capacity = capacity;
		this.shape = shape;
		this.image = image;
		this.bigImage = bigImage;
		this.cateCode = cateCode;
		this.explanation = explanation;
		
	}
	
	
	
	public String getExplanation() {
		return explanation;
	}
	public void setExplanation(String explanation) {
		this.explanation = explanation;
	}
	public String getBigImage() {
		return bigImage;
	}
	public void setBigImage(String bigImage) {
		this.bigImage = bigImage;
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
	public int getConsumerPrice() {
		return consumerPrice;
	}
	public void setConsumerPrice(int consumerPrice) {
		this.consumerPrice = consumerPrice;
	}
	public int getSellingPrice() {
		return sellingPrice;
	}
	public void setSellingPrice(int sellingPrice) {
		this.sellingPrice = sellingPrice;
	}
	public String getCapacity() {
		return capacity;
	}
	public void setCapacity(String capacity) {
		this.capacity = capacity;
	}
	public String getShape() {
		return shape;
	}
	public void setShape(String shape) {
		this.shape = shape;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getCateCode() {
		return cateCode;
	}
	public void setCateCode(int cateCode) {
		this.cateCode = cateCode;
	}
	
	
}