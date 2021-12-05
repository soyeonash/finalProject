package com.daol.library.book.domain;

import java.sql.Date;

import com.daol.library.interestingBook.domain.InterestingBook;
import com.daol.library.lendingBook.domain.LendingBook;

public class Book {
	private int bookNo;
	private String bookName;
	private String bookWriter;
	private String bookSubject;
	private String publisher;
	private int bookYear;
	private int callNo;
	private String isbn;
	private String bookCover;
	private String theme;
	private String bookState;
	private Date updateDate;
	private int lendingCount;
	private LendingBook lendingBook;
	private Review review;
	private InterestingBook interestingBook;
	
	public Book() {}

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

	public String getBookSubject() {
		return bookSubject;
	}

	public void setBookSubject(String bookSubject) {
		this.bookSubject = bookSubject;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public int getBookYear() {
		return bookYear;
	}

	public void setBookYear(int bookYear) {
		this.bookYear = bookYear;
	}

	public int getCallNo() {
		return callNo;
	}

	public void setCallNo(int callNo) {
		this.callNo = callNo;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public String getBookCover() {
		return bookCover;
	}

	public void setBookCover(String bookCover) {
		this.bookCover = bookCover;
	}

	public String getTheme() {
		return theme;
	}

	public void setTheme(String theme) {
		this.theme = theme;
	}

	public String getBookState() {
		return bookState;
	}

	public void setBookState(String bookState) {
		this.bookState = bookState;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public int getLendingCount() {
		return lendingCount;
	}

	public void setLendingCount(int lendingCount) {
		this.lendingCount = lendingCount;
	}

	public LendingBook getLendingBook() {
		return lendingBook;
	}

	public void setLendingBook(LendingBook lendingBook) {
		this.lendingBook = lendingBook;
	}

	public Review getReview() {
		return review;
	}

	public void setReview(Review review) {
		this.review = review;
	}

	public InterestingBook getInterestingBook() {
		return interestingBook;
	}

	public void setInterestingBook(InterestingBook interestingBook) {
		this.interestingBook = interestingBook;
	}

	@Override
	public String toString() {
		return "Book [bookNo=" + bookNo + ", bookName=" + bookName + ", bookWriter=" + bookWriter + ", bookSubject="
				+ bookSubject + ", publisher=" + publisher + ", bookYear=" + bookYear + ", callNo=" + callNo + ", isbn="
				+ isbn + ", bookCover=" + bookCover + ", theme=" + theme + ", bookState=" + bookState + ", updateDate="
				+ updateDate + ", lendingCount=" + lendingCount + ", lendingBook=" + lendingBook + ", review=" + review
				+ ", interestingBook=" + interestingBook + "]";
	}

}
