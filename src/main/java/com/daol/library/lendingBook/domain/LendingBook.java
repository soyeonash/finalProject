package com.daol.library.lendingBook.domain;

import java.sql.Date;

import com.daol.library.book.domain.Book;

public class LendingBook {
	private int lendingNo;
	private Date lendingDate;
	private Date returnDate;
	private int extendCount;
	private String receive;
	private String userId;
	private int bookNo;
	private Book book;
	private String returnState;
	
	public LendingBook() {}

	public int getLendingNo() {
		return lendingNo;
	}

	public void setLendingNo(int lendingNo) {
		this.lendingNo = lendingNo;
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

	public String getReceive() {
		return receive;
	}

	public void setReceive(String receive) {
		this.receive = receive;
	}

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

	public String getReturnState() {
		return returnState;
	}

	public void setReturnState(String returnState) {
		this.returnState = returnState;
	}

	@Override
	public String toString() {
		return "LendingBook [lendingNo=" + lendingNo + ", lendingDate=" + lendingDate + ", returnDate=" + returnDate
				+ ", extendCount=" + extendCount + ", receive=" + receive + ", userId=" + userId + ", bookNo=" + bookNo
				+ ", returnState=" + returnState + "]";
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}
	
}
