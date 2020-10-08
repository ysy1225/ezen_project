package com.company.matching.model;

import java.sql.Date;

public class comGood {
	private int comNum;
	private int userNum;
	private String userName;
	private String comCate;
	private String comSubject;
	private String comContent;
	private Date comDate;
	private int gCount;
	private int bCount;
	
	
	public int getgCount() {
		return gCount;
	}
	public void setgCount(int gCount) {
		this.gCount = gCount;
	}
	public int getbCount() {
		return bCount;
	}
	public void setbCount(int bCount) {
		this.bCount = bCount;
	}
	public int getComNum() {
		return comNum;
	}
	public void setComNum(int comNum) {
		this.comNum = comNum;
	}
	public int getUserNum() {
		return userNum;
	}
	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getComCate() {
		return comCate;
	}
	public void setComCate(String comCate) {
		this.comCate = comCate;
	}
	public String getComSubject() {
		return comSubject;
	}
	public void setComSubject(String comSubject) {
		this.comSubject = comSubject;
	}
	public String getComContent() {
		return comContent;
	}
	public void setComContent(String comContent) {
		this.comContent = comContent;
	}
	public Date getComDate() {
		return comDate;
	}
	public void setComDate(Date comDate) {
		this.comDate = comDate;
	}
	
	
}
