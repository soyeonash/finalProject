package com.daol.library.post.domain;

public class ReplyReport {
	private int reportNo;
	private int replyNo;
	private String rStatus;
	private int postNo;
	
	public ReplyReport() {}

	public int getReportNo() {
		return reportNo;
	}

	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}

	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	public String getrStatus() {
		return rStatus;
	}

	public void setrStatus(String rStatus) {
		this.rStatus = rStatus;
	}

	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}

	@Override
	public String toString() {
		return "ReplyReport [reportNo=" + reportNo + ", replyNo=" + replyNo + ", rStatus=" + rStatus + ", postNo="
				+ postNo + "]";
	}
	
	
}
