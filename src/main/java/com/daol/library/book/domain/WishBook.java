package com.daol.library.book.domain;

import java.sql.Date;

public class WishBook {
	private int applyNo;
	private String userId;
	private String bookName;
	private String bookWriter;
	private String publisher;
	private String applyStatus;
	private Date applyDate;
	
	public WishBook() {}

	public int getApplyNo() {
		return applyNo;
	}

	public void setApplyNo(int applyNo) {
		this.applyNo = applyNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public String getBookWriter() {
		return bookWriter;
	}

	public void setBookWriter(String bookWriter) {
		this.bookWriter = bookWriter;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public String getApplyStatus() {
		return applyStatus;
	}

	public void setApplyStatus(String applyStatus) {
		this.applyStatus = applyStatus;
	}

	public Date getApplyDate() {
		return applyDate;
	}

	public void setApplyDate(Date applyDate) {
		this.applyDate = applyDate;
	}

	@Override
	public String toString() {
		return "WishBook [신청 번호 =" + applyNo + ", 회원 아이디 =" + userId + ", 도서명 =" + bookName + ", 저자 ="
				+ bookWriter + ", 출판사 =" + publisher + ", 처리 상태 =" + applyStatus + ", 신청일 =" + applyDate
				+ "]";
	}
	
	
}
