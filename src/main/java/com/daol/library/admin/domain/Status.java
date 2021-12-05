package com.daol.library.admin.domain;

import java.util.Date;

public class Status {

	private String userId;
	private int bookNo;
	private String bookName;
	private String bookWriter;
	private String userNo;
	private Date lendingDate;
	private Date returnDate;
	private int extendCount;
	private int lendingNo;
	
	public Status() {}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getBookNo() {
		return bookNo;
	}

	public void setBookNo(int bookNo) {
		this.bookNo = bookNo;
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

	public String getUserNo() {
		return userNo;
	}

	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}

	public Date getLendingDate() {
		return lendingDate;
	}

	public void setLendingDate(Date lendingDate) {
		this.lendingDate = lendingDate;
	}

	public Date getReturnDate() {
		return returnDate;
	}

	public void setReturnDate(Date returnDate) {
		this.returnDate = returnDate;
	}

	public int getExtendCount() {
		return extendCount;
	}

	public void setExtendCount(int extendCount) {
		this.extendCount = extendCount;
	}

	public int getLendingNo() {
		return lendingNo;
	}

	public void setLendingNo(int lendingNo) {
		this.lendingNo = lendingNo;
	}

	@Override
	public String toString() {
		return "Status [userId=" + userId + ", bookNo=" + bookNo + ", bookName=" + bookName + ", bookWriter="
				+ bookWriter + ", userNo=" + userNo + ", lendingDate=" + lendingDate + ", returnDate=" + returnDate
				+ ", extendCount=" + extendCount + ", lendingNo=" + lendingNo + "]";
	}
	
	
	
}
	
	