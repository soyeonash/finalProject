package com.daol.library.member.domain;

import java.util.Date;

import com.daol.library.reservationBook.domain.ReservationBook;

public class Member {

	private String userId;
	private String userPwd;
	private String userNo;
	private String userName;
	private String userPhone;
	private String userType;
	private String userEmail;
	private int studentId;
	private String major;
	private String profilePic;
	private String annualFee;
	private Date payDate;
	private Date enrollDate;
	private String passCheck;
	private Date approvalDate;
	private Date endDate;
	private String socialId;
	private String surveyCheck;
	private int lendingCopy;
	private ReservationBook reservationBook;

	public Member() {
		super();
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserNo() {
		return userNo;
	}

	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public int getStudentId() {
		return studentId;
	}

	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public String getProfilePic() {
		return profilePic;
	}

	public void setProfilePic(String profilePic) {
		this.profilePic = profilePic;
	}

	public String getAnnualFee() {
		return annualFee;
	}

	public void setAnnualFee(String annualFee) {
		this.annualFee = annualFee;
	}

	public Date getPayDate() {
		return payDate;
	}

	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getPassCheck() {
		return passCheck;
	}

	public void setPassCheck(String passCheck) {
		this.passCheck = passCheck;
	}

	public Date getApprovalDate() {
		return approvalDate;
	}

	public void setApprovalDate(Date approvalDate) {
		this.approvalDate = approvalDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getSocialId() {
		return socialId;
	}

	public void setSocialId(String socialId) {
		this.socialId = socialId;
	}

	public String getSurveyCheck() {
		return surveyCheck;
	}

	public void setSurveyCheck(String surveyCheck) {
		this.surveyCheck = surveyCheck;
	}

	public int getLendingCopy() {
		return lendingCopy;
	}

	public void setLendingCopy(int lendingCopy) {
		this.lendingCopy = lendingCopy;
	}

	public ReservationBook getReservationBook() {
		return reservationBook;
	}

	public void setReservationBook(ReservationBook reservationBook) {
		this.reservationBook = reservationBook;
	}

	@Override
	public String toString() {
		return "Member [userId=" + userId + ", userPwd=" + userPwd + ", userNo=" + userNo + ", userName=" + userName
				+ ", userPhone=" + userPhone + ", userType=" + userType + ", userEmail=" + userEmail + ", studentId="
				+ studentId + ", major=" + major + ", profilePic=" + profilePic + ", annualFee=" + annualFee
				+ ", payDate=" + payDate + ", enrollDate=" + enrollDate + ", passCheck=" + passCheck + ", approvalDate="
				+ approvalDate + ", endDate=" + endDate + ", socialId=" + socialId + ", surveyCheck=" + surveyCheck
				+ ", lendingCopy=" + lendingCopy + ", reservationBook=" + reservationBook + "]";
	}

}
