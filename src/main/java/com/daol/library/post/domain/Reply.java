package com.daol.library.post.domain;

import java.sql.Date;

public class Reply {

	private int replyNo;
	private int postNo;
	private String replyWriter;
	private String replyContents;
	private Date replyDate;
	private ReplyReport replyReport;
	
	public Reply() {}

	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}

	public String getReplyWriter() {
		return replyWriter;
	}

	public void setReplyWriter(String replyWriter) {
		this.replyWriter = replyWriter;
	}

	public String getReplyContents() {
		return replyContents;
	}

	public void setReplyContents(String replyContents) {
		this.replyContents = replyContents;
	}

	public Date getReplyDate() {
		return replyDate;
	}

	public void setReplyDate(Date replyDate) {
		this.replyDate = replyDate;
	}
	
	
	public ReplyReport getReplyReport() {
		return replyReport;
	}

	public void setReplyReport(ReplyReport replyReport) {
		this.replyReport = replyReport;
	}

	@Override
	public String toString() {
		return "Reply [replyNo=" + replyNo + ", postNo=" + postNo + ", replyWriter=" + replyWriter + ", replyContents="
				+ replyContents + ", replyDate=" + replyDate + "]";
	}
	
	
}
