package com.daol.library.interestingBook.domain;

public class InterestingBook {
	private int interestNo;
	private int bookNo;
	private String userId;
	
	public InterestingBook() {}

	public int getInterestNo() {
		return interestNo;
	}

	public void setInterestNo(int interestNo) {
		this.interestNo = interestNo;
	}

	public int getBookNo() {
		return bookNo;
	}

	public void setBookNo(int bookNo) {
		this.bookNo = bookNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "InterestingBook [interestNo=" + interestNo + ", bookNo=" + bookNo + ", userId=" + userId + "]";
	}
	
}
