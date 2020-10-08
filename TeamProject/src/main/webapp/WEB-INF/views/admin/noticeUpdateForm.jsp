<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/main/top.jsp"%>

  <!-- 회원관리 테이블 CSS File -->
  <link href="${pageContext.request.contextPath}/resources/admin/member/images/icons/favicon.ico?after" rel="icon">
  <link href="${pageContext.request.contextPath}/resources/admin/member/main2.css?after" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/admin/member/util.css?after" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/admin/member/search.css?after" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/admin/member/notice.css?after" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Rubik:wght@300;400;500&display=swap" rel="stylesheet">

  <main id="main">
  
    <div class="limiter">
      <div class="container-table100">      
	    <div class="wrap-table100">
	      
	      <form action="update_notice.do" method="post" onsubmit="return checkForm();">
	      <input type="hidden" name="num" value="${param.num}"/>
	      <div style="width: 900px; overflow: hidden; margin-left: 85px; display: grid;">
	        <div class="comment-form">
	          <h4>공지사항 작성</h4>
	        </div>
	        <hr style="margin: 40px 0 40px 0;">
	        <div class="group">
	          <input class="subjectBox" name="subject" id="website" type="text" value="${getNotice.subject}">         
	        </div>
	        <div class="group">
	          <input class="subjectBox" name="writer" id="website" type="text" value="${getNotice.writer}">         
	        </div>
	        <div class="group">
	          <textarea class="subjectBox" name="content" id="content">${getNotice.content}</textarea>         
	        </div>
	        <hr style="margin: 0 0 40px 0;">
	        <div class="subjectListButton">
	          <input class="noticeButton" type="submit" value="수정하기">
	        </div>
	      </div>
	      </form>      
		  
	    </div>
      </div>
    </div>
  
  </main>

<%@ include file="/WEB-INF/views/main/bottom.jsp"%>