package com.daol.library.taste.domain;

public class Taste {
	private String userId;
	private String taste1;
	private String taste2;
	private String taste3;
	private TasteSurvey tasteSurvey;
	
	
	public Taste () {}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getTaste1() {
		return taste1;
	}

	public void setTaste1(String taste1) {
		this.taste1 = taste1;
	}

	public String getTaste2() {
		return taste2;
	}

	public void setTaste2(String taste2) {
		this.taste2 = taste2;
	}

	public String getTaste3() {
		return taste3;
	}

	public void setTaste3(String taste3) {
		this.taste3 = taste3;
	}
	
	

	public TasteSurvey getTasteSurvey() {
		return tasteSurvey;
	}

	public void setTasteSurvey(TasteSurvey tasteSurvey) {
		this.tasteSurvey = tasteSurvey;
	}

	@Override
	public String toString() {
		return "Taste [회원 아이디 =" + userId + ", 취향1 =" + taste1 + ", 취향2 =" + taste2 + ", 취향3=" + taste3 + "]";
	}
	
	
}
