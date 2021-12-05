package com.daol.library.admin.domain;

public class Statistics {

	private String bookSubject;
	private int lendingCount;
	
	public Statistics() {}

	public String getBookSubject() {
		return bookSubject;
	}

	public void setBookSubject(String bookSubject) {
		this.bookSubject = bookSubject;
	}

	public int getLendingCount() {
		return lendingCount;
	}

	public void setLendingCount(int lendingCount) {
		this.lendingCount = lendingCount;
	}

	@Override
	public String toString() {
		return "Statistics [bookSubject=" + bookSubject + ", lendingCount=" + lendingCount + "]";
	}
	
}
