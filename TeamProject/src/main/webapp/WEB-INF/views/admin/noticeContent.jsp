<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="/WEB-INF/views/main/top.jsp"%>

  <!-- 회원관리 테이블 CSS File -->
  <link href="${pageContext.request.contextPath}/resources/admin/member/images/icons/favicon.ico?after" rel="icon">
  <link href="${pageContext.request.contextPath}/resources/admin/member/main.css?after" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/admin/member/util.css?after" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/admin/member/page.css?after" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/admin/member/search.css?after" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Rubik:wght@300;400;500&display=swap" rel="stylesheet">

  <main id="main">
  
    <div class="limiter">
      <div class="container-table100">      
	    <div class="wrap-table100">
	      
	      <div style="width: 900px; overflow: hidden; margin-left: 85px; display: grid;">
	        <div style="display: flex; float: left;">
	          <font style="font-size: 30px; font-family: 'Rubik', sans-serif; border-bottom: 1px solid #d6d6d6; padding-bottom: 10px;">Notice</font>
	        </div>
	        <div style="display: flex; float: left; padding: 14px 0 6px 0;">
	          <font class="subjectContent">${getNotice.subject}</font>	         
	        </div>
	        <div class="subjectText" style="padding: 0 0 50px 0;">
	          <a href="listNotice.do" class="subjectTextTag">
	            <ion-icon name="person-outline" style="vertical-align: middle; padding-top: 2px;"></ion-icon>
	            <font style="font-size: 12px; vertical-align: middle;">공지사항</font>&nbsp;&nbsp;&nbsp;
	          </a>
	        
	          <ion-icon name="eye-outline" style="vertical-align: middle; padding-top: 2px;"></ion-icon>
	          <font style="font-size: 12px; vertical-align: middle;">${getNotice.readcount}</font>
	        </div>
	        <div class="subjectMain">
	          <font>${getNotice.content}</font>
	        </div>
	        <div class="subjectListButton" style="margin-top: 50px;">
	          <a href="adminListNotice.do">목록으로</a>
	          <a href="updateForm_notice.do?num=${getNotice.num}">수정</a>
	          <a href="delete_notice.do?num=${getNotice.num}">삭제</a>
	        </div>
	      </div>	      
		  
	    </div>
      </div>
    </div>
  
  </main>
  
<%@ include file="bottom.jsp"%>