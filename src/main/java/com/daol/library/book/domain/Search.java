package com.daol.library.book.domain;

public class Search {
	private String searchCondition;
	private String searchValue;
	private String searchValue1;
	private String searchValue2;
	private String searchValue3;
	private String searchValue4;
	private String searchValue5;
	
	public Search() {}

	public String getSearchCondition() {
		return searchCondition;
	}

	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}

	public String getSearchValue() {
		return searchValue;
	}

	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}

	public String getSearchValue1() {
		return searchValue1;
	}

	public void setSearchValue1(String searchValue1) {
		this.searchValue1 = searchValue1;
	}

	public String getSearchValue2() {
		return searchValue2;
	}

	public void setSearchValue2(String searchValue2) {
		this.searchValue2 = searchValue2;
	}

	public String getSearchValue3() {
		return searchValue3;
	}

	public void setSearchValue3(String searchValue3) {
		this.searchValue3 = searchValue3;
	}

	public String getSearchValue4() {
		return searchValue4;
	}

	public void setSearchValue4(String searchValue4) {
		this.searchValue4 = searchValue4;
	}

	public String getSearchValue5() {
		return searchValue5;
	}

	public void setSearchValue5(String searchValue5) {
		this.searchValue5 = searchValue5;
	}

	@Override
	public String toString() {
		return "Search [searchCondition=" + searchCondition + ", searchValue=" + searchValue + ", searchValue1="
				+ searchValue1 + ", searchValue2=" + searchValue2 + ", searchValue3=" + searchValue3 + ", searchValue4="
				+ searchValue4 + ", searchValue5=" + searchValue5 + "]";
	}

}
