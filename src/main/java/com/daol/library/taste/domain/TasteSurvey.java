package com.daol.library.taste.domain;

import java.sql.Date;

import com.daol.library.book.domain.Book;

public class TasteSurvey {
	private String userId;
	private int bookNo;
	private String bookName;
	private double bookRating;
	private String bookSubject;
	private String theme;
	private Date surveyDate;
	private Book book;
	
	public TasteSurvey() {}

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

	public double getBookRating() {
		return bookRating;
	}

	public void setBookRating(double bookRating) {
		this.bookRating = bookRating;
	}

	public String getBookSubject() {
		return bookSubject;
	}

	public void setBookSubject(String bookSubject) {
		this.bookSubject = bookSubject;
	}

	public String getTheme() {
		return theme;
	}

	public void setTheme(String theme) {
		this.theme = theme;
	}

	public Date getSurveyDate() {
		return surveyDate;
	}

	public void setSurveyDate(Date surveyDate) {
		this.surveyDate = surveyDate;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	@Override
	public String toString() {
		return "TasteSurvey [userId=" + userId + ", bookNo=" + bookNo + ", bookName=" + bookName + ", bookRating="
				+ bookRating + ", bookSubject=" + bookSubject + ", theme=" + theme + ", surveyDate=" + surveyDate + "]";
	}

	


	
	

	
	
}
