package com.daol.library.studyRoom.domain;

public class StudyRoom {
	private int sReservationNo;
	private String userId;
	private String sReservationDate;
	private String sReservationTime;
	private String purpose;
	private String personnel;
	
	public StudyRoom() {}

	public int getsReservationNo() {
		return sReservationNo;
	}

	public void setsReservationNo(int sReservationNo) {
		this.sReservationNo = sReservationNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getsReservationDate() {
		return sReservationDate;
	}

	public void setsReservationDate(String sReservationDate) {
		this.sReservationDate = sReservationDate;
	}

	public String getsReservationTime() {
		return sReservationTime;
	}

	public void setsReservationTime(String sReservationTime) {
		this.sReservationTime = sReservationTime;
	}

	public String getPurpose() {
		return purpose;
	}

	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}

	public String getPersonnel() {
		return personnel;
	}

	public void setPersonnel(String personnel) {
		this.personnel = personnel;
	}

	@Override
	public String toString() {
		return "StudyRoom [예약번호=" + sReservationNo + ", 아이디=" + userId + ", 예약일="
				+ sReservationDate + ", 예약시간=" + sReservationTime + ", 사용목적=" + purpose + ", 사용인원="
				+ personnel + "]";
	}

}
