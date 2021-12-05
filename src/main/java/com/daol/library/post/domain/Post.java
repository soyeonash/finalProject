package com.daol.library.post.domain;


import java.sql.Date;

public class Post {
	
	private int postNo;
	private String postWriter;
	private String postTitle;
	private String postContents;
	private Date postDate;
	private int pViewCount;
	private int replyCnt;
	private PostReport postReport;
	
	public Post() {}

	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}

	public String getPostWriter() {
		return postWriter;
	}

	public void setPostWriter(String postWriter) {
		this.postWriter = postWriter;
	}

	public String getPostTitle() {
		return postTitle;
	}

	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}

	public String getPostContents() {
		return postContents;
	}

	public void setPostContents(String postContents) {
		this.postContents = postContents;
	}

	public Date getPostDate() {
		return postDate;
	}

	public void setPostDate(Date postDate) {
		this.postDate = postDate;
	}

	public int getpViewCount() {
		return pViewCount;
	}

	public void setpViewCount(int pViewCount) {
		this.pViewCount = pViewCount;
	}

	public int getReplyCnt() {
		return replyCnt;
	}

	public void setReplyCnt(int replyCnt) {
		this.replyCnt = replyCnt;
	}
	
	
	public PostReport getPostReport() {
		return postReport;
	}

	public void setPostReport(PostReport postReport) {
		this.postReport = postReport;
	}

	@Override
	public String toString() {
		return "Post [postNo=" + postNo + ", postWriter=" + postWriter + ", postTitle=" + postTitle + ", postContents="
				+ postContents + ", postDate=" + postDate + ", pViewCount=" + pViewCount + ", replyCnt=" + replyCnt
				+ "]";
	}
	
	

	
	
}
