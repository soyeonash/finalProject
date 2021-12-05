package com.daol.library.book.domain;

import java.sql.Date;

public class Review {
	private int reviewNo;
	private int bookNo;
	private double reviewStar;
	private String reviewContents;
	private Date reviewDate;
	private String reviewStatus;
	private String userId;
	
	public Review () {}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public int getBookNo() {
		return bookNo;
	}

	public void setBookNo(int bookNo) {
		this.bookNo = bookNo;
	}

	public double getReviewStar() {
		return reviewStar;
	}

	public void setReviewStar(double reviewStar) {
		this.reviewStar = reviewStar;
	}

	public String getReviewContents() {
		return reviewContents;
	}

	public void setReviewContents(String reviewContents) {
		this.reviewContents = reviewContents;
	}

	public Date getReviewDate() {
		return reviewDate;
	}

	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
	}

	public String getReviewStatus() {
		return reviewStatus;
	}

	public void setReviewStatus(String reviewStatus) {
		this.reviewStatus = reviewStatus;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "Review [서평 번호 =" + reviewNo + ", 도서 번호 =" + bookNo + ", 별점 =" + reviewStar
				+ ", 내용 =" + reviewContents + ", 작성일 =" + reviewDate + ", 작성 여부 =" + reviewStatus
				+ ", 작성자 =" + userId + "]";
	}
	
	
}
