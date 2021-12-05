package com.daol.library.book.domain;

import java.sql.Date;

public class Keyword {

	private String keyword;
	private Date searchDate;
	
	public Keyword() {}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public Date getSearchDate() {
		return searchDate;
	}
	public void setSearchDate(Date searchDate) {
		this.searchDate = searchDate;
	}
	@Override
	public String toString() {
		return "Keyword [keyword=" + keyword + ", searchDate=" + searchDate + "]";
	}
	
	
}
