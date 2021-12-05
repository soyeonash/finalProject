package com.daol.library.lendingBook.domain;

public class Parcel {
	private int deliveryNo;
	private int lendingNo;
	private String addr;
	private String dStatus;
	
	public Parcel() {}

	public int getDeliveryNo() {
		return deliveryNo;
	}

	public void setDeliveryNo(int deliveryNo) {
		this.deliveryNo = deliveryNo;
	}

	public int getLendingNo() {
		return lendingNo;
	}

	public void setLendingNo(int lendingNo) {
		this.lendingNo = lendingNo;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getdStatus() {
		return dStatus;
	}

	public void setdStatus(String dStatus) {
		this.dStatus = dStatus;
	}

	@Override
	public String toString() {
		return "Parcel [deliveryNo=" + deliveryNo + ", lendingNo=" + lendingNo + ", addr=" + addr + ", dStatus="
				+ dStatus + "]";
	}

}
