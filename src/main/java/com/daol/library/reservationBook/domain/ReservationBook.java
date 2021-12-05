package com.daol.library.reservationBook.domain;

import java.sql.Date;

import com.daol.library.book.domain.Book;

public class ReservationBook {
	private int rsvNo;
	private int bookNo;
	private String userId;
	private Date rsvDate;
	private String rsvState;
	private Book book;
	
	public ReservationBook() {}

	public int getRsvNo() {
		return rsvNo;
	}

	public void setRsvNo(int rsvNo) {
		this.rsvNo = rsvNo;
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

	public Date getRsvDate() {
		return rsvDate;
	}

	public void setRsvDate(Date rsvDate) {
		this.rsvDate = rsvDate;
	}

	public String getRsvState() {
		return rsvState;
	}

	public void setRsvState(String rsvState) {
		this.rsvState = rsvState;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	@Override
	public String toString() {
		return "ReservationBook [rsvNo=" + rsvNo + ", bookNo=" + bookNo + ", userId=" + userId + ", rsvDate=" + rsvDate
				+ ", rsvState=" + rsvState + ", book=" + book + "]";
	}
	
}
