package com.company.matching.service;

public class LoginCheck {
	
	public static final int OK=0;
	public static final int NOT_ID=1;
	public static final int NOT_PW=2;
	public static final int ERROR=-1;
	
	private String userName;
	private String userEmail;
	private String userPw1;
	private int userLevel;
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserPw1() {
		return userPw1;
	}
	public void setUserPw1(String userPw1) {
		this.userPw1 = userPw1;
	}
	public int getUserLevel() {
		return userLevel;
	}
	public void setUserLevel(int userLevel) {
		this.userLevel = userLevel;
	}

}
