package com.daol.library.post.domain;

public class PostReport {
	private int reportNo;
	private int postNo;
	private String postState;
	
	public PostReport() {}
	
	public int getReportNo() {
		return reportNo;
	}
	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}
	public int getPostNo() {
		return postNo;
	}
	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}
	public String getPostState() {
		return postState;
	}
	public void setPostState(String postState) {
		this.postState = postState;
	}

	@Override
	public String toString() {
		return "PostReport [reportNo=" + reportNo + ", postNo=" + postNo + ", postState=" + postState + "]";
	}
	
	
}
