package com.daol.library.readingRoom.domain;

import java.sql.Date;

public class ReadingRoom {
	private int rReservationNo;
	private String userId;
	private Date rReservationDate;
	private String rReservationTime;
	private String seatNo;
	private int count;
	
	public ReadingRoom() {}
	
	public int getrReservationNo() {
		return rReservationNo;
	}
	public void setrReservationNo(int rReservationNo) {
		this.rReservationNo = rReservationNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Date getrReservationDate() {
		return rReservationDate;
	}
	public void setrReservationDate(Date rReservationDate) {
		this.rReservationDate = rReservationDate;
	}
	public String getrReservationTime() {
		return rReservationTime;
	}
	public void setrReservationTime(String rReservationTime) {
		this.rReservationTime = rReservationTime;
	}
	public String getSeatNo() {
		return seatNo;
	}
	public void setSeatNo(String seatNo) {
		this.seatNo = seatNo;
	}
	
	
	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	@Override
	public String toString() {
		return "ReadingRoom [rReservationNo=" + rReservationNo + ", userId=" + userId + ", rReservationDate="
				+ rReservationDate + ", rReservationTime=" + rReservationTime + ", seatNo=" + seatNo + ", count="
				+ count + "]";
	}
}
