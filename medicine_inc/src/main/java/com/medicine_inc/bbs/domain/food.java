package com.medicine_inc.bbs.domain;

public class food {

	private int foodId;
	private String diseaseGroup;
	private String disease;
	private String name;
	private String effect;
	
	public food(int foodId, String diseaseGroup, String disease, String name, String effect) {
		this.foodId=foodId;
		this.diseaseGroup=diseaseGroup;
		this.disease = disease;
		this.name=name;
		this.effect=effect;
	};
	
	public food() {
		
	};
	
	public int getFoodId() {
		return foodId;
	}
	public void setFoodId(int foodId) {
		this.foodId = foodId;
	}
	public String getDiseaseGroup() {
		return diseaseGroup;
	}
	public void setDiseaseGroup(String diseaseGroup) {
		this.diseaseGroup = diseaseGroup;
	}
	public String getDisease() {
		return disease;
	}
	public void setDisease(String disease) {
		this.disease = disease;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEffect() {
		return effect;
	}
	public void setEffect(String effect) {
		this.effect = effect;
	}

}
