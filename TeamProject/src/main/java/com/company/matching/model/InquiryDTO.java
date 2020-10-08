package com.company.matching.model;

public class InquiryDTO {
	
	private int inqNum;
	private String inqName;
	private String userEmail;
	private String inqPhone;
	private String inqSubject;
	private String inqContent;
	private String filename;
	private int filesize;
	private String inqDate;
	private int inqOk;
	
	public int getInqNum() {
		return inqNum;
	}
	public void setInqNum(int inqNum) {
		this.inqNum = inqNum;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getInqName() {
		return inqName;
	}
	public void setInqName(String inqName) {
		this.inqName = inqName;
	}
	public String getInqPhone() {
		return inqPhone;
	}
	public void setInqPhone(String inqPhone) {
		this.inqPhone = inqPhone;
	}
	public String getInqSubject() {
		return inqSubject;
	}
	public void setInqSubject(String inqSubject) {
		this.inqSubject = inqSubject;
	}
	public String getInqContent() {
		return inqContent;
	}
	public void setInqContent(String inqContent) {
		this.inqContent = inqContent;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public int getFilesize() {
		return filesize;
	}
	public void setFilesize(int filesize) {
		this.filesize = filesize;
	}
	public String getInqDate() {
		return inqDate;
	}
	public void setInqDate(String inqDate) {
		this.inqDate = inqDate;
	}
	public int getInqOk() {
		return inqOk;
	}
	public void setInqOk(int inqOk) {
		this.inqOk = inqOk;
	}

}
