package com.daol.library.mypage.domain;

import java.sql.Date;

public class Qna {
	
	private int qnaNo;
	private String userId;
	private String replyState;
	private String qnaTitle;
	private String qnaContent;
	private Date qnaWriteDate;
	private String replyContent;
	private Date replyWriteDate;
	private String replyUserId;
	
	public Qna() {}

	public int getQnaNo() {
		return qnaNo;
	}

	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getReplyState() {
		return replyState;
	}

	public void setReplyState(String replyState) {
		this.replyState = replyState;
	}

	public String getQnaTitle() {
		return qnaTitle;
	}

	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}

	public String getQnaContent() {
		return qnaContent;
	}

	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}

	public Date getQnaWriteDate() {
		return qnaWriteDate;
	}

	public void setQnaWriteDate(Date qnaWriteDate) {
		this.qnaWriteDate = qnaWriteDate;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public Date getReplyWriteDate() {
		return replyWriteDate;
	}

	public void setReplyWriteDate(Date replyWriteDate) {
		this.replyWriteDate = replyWriteDate;
	}

	public String getReplyUserId() {
		return replyUserId;
	}

	public void setReplyUserId(String replyUserId) {
		this.replyUserId = replyUserId;
	}

	@Override
	public String toString() {
		return "Qna [qnaNo=" + qnaNo + ", userId=" + userId + ", replyState=" + replyState + ", qnaTitle=" + qnaTitle
				+ ", qnaContent=" + qnaContent + ", qnaWriteDate=" + qnaWriteDate + ", replyContent=" + replyContent
				+ ", replyWriteDate=" + replyWriteDate + ", replyUserId=" + replyUserId + "]";
	}
	
	
}
