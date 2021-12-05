package com.daol.library.admin.domain;

public class BookParcel {

	private String bookName;
	private String bookWriter;
	private String publisher;
	private int userNo;
	private String userId;
	private String addr;
	private String dStatus;
	private int deliveryNo;
	private int lendingNo;
	
	public BookParcel() {}

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

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getdStatus() {
		return dStatus;
	}

	public void setdStatus(String dStatus) {
		this.dStatus = dStatus;
	}

	public int getDeliveryNo() {
		return deliveryNo;
	}

	public void setDeliveryNo(int deliveryNo) {
		this.deliveryNo = deliveryNo;
	}

	public int getLendingNo() {
		return lendingNo;
	}

	public void setLendingNo(int lendingNo) {
		this.lendingNo = lendingNo;
	}

	@Override
	public String toString() {
		return "BookParcel [bookName=" + bookName + ", bookWriter=" + bookWriter + ", publisher=" + publisher
				+ ", userNo=" + userNo + ", userId=" + userId + ", addr=" + addr + ", dStatus=" + dStatus
				+ ", deliveryNo=" + deliveryNo + ", lendingNo=" + lendingNo + "]";
	}

	
}