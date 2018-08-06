package com.playground.vo;

public class FestivalInfo {
	private int contentId;
	private String eventplace;
	private String placeinfo;
	private String program;
	private String usetimefestival;
	
	public FestivalInfo() {}

	public FestivalInfo(int contentId, String eventplace, String placeinfo, String program, String usetimefestival) {
		this.contentId = contentId;
		this.eventplace = eventplace;
		this.placeinfo = placeinfo;
		this.program = program;
		this.usetimefestival = usetimefestival;
	}

	public int getContentId() {
		return contentId;
	}

	public void setContentId(int contentId) {
		this.contentId = contentId;
	}

	public String getEventplace() {
		return eventplace;
	}

	public void setEventplace(String eventplace) {
		this.eventplace = eventplace;
	}

	public String getPlaceinfo() {
		return placeinfo;
	}

	public void setPlaceinfo(String placeinfo) {
		this.placeinfo = placeinfo;
	}

	public String getProgram() {
		return program;
	}

	public void setProgram(String program) {
		this.program = program;
	}

	public String getUsetimefestival() {
		return usetimefestival;
	}

	public void setUsetimefestival(String usetimefestival) {
		this.usetimefestival = usetimefestival;
	}
	
}
