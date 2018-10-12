package com.medicine_inc.bbs.domain;

public class IllList {
	
	private int code;
	private String illClass;
    private String name;
    private String nameEn;
    private String relatedDiseases;
    private String symptom;
    private String cause;
    private String diagnosis;
    private String cure;

    public IllList() {}
    public IllList(int code, String illClass, String name, String nameEn, String relatedDiseases,
    		String symptom, String cause, String diagnosis, String cure) {
    	this.code = code;
    	this.illClass = illClass;
    	this.name = name;
    	this.nameEn=nameEn;
    	this.relatedDiseases=relatedDiseases;
    	this.symptom=symptom;
    	this.cause=cause;
    	this.diagnosis=diagnosis;
    	this.cure=cure;
    	
    
    }

	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getIllClass() {
		return illClass;
	}
	public void setIllClass(String illClass) {
		this.illClass = illClass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNameEn() {
		return nameEn;
	}
	public void setNameEn(String nameEn) {
		this.nameEn = nameEn;
	}
	public String getRelatedDiseases() {
		return relatedDiseases;
	}
	public void setRelatedDiseases(String relatedDiseases) {
		this.relatedDiseases = relatedDiseases;
	}
	public String getSymptom() {
		return symptom;
	}
	public void setSymptom(String symptom) {
		this.symptom = symptom;
	}
	public String getCause() {
		return cause;
	}
	public void setCause(String cause) {
		this.cause = cause;
	}
	public String getDiagnosis() {
		return diagnosis;
	}
	public void setDiagnosis(String diagnosis) {
		this.diagnosis = diagnosis;
	}
	public String getCure() {
		return cure;
	}
	public void setCure(String cure) {
		this.cure = cure;
	}
	
    
    
    
}
