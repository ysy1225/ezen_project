<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@ include file="/WEB-INF/views/main/top.jsp"%>

  <!-- 회원관리 테이블 CSS File -->
  <link href="${pageContext.request.contextPath}/resources/admin/member/images/icons/favicon.ico?after" rel="icon">
  <link href="${pageContext.request.contextPath}/resources/admin/member/main.css?after" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/admin/member/util.css?after" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/admin/member/page.css?after" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/admin/member/search.css?after" rel="stylesheet">  
  <link href="${pageContext.request.contextPath}/resources/admin/member/notice.css?after" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Rubik:wght@300;400;500&display=swap" rel="stylesheet">  
  <link href="${pageContext.request.contextPath}/resources/main/profile.css?after" rel="stylesheet">

  <main id="main">
  
    <div class="limiter">
      <div class="container-table100">      
	    <div class="wrap-table100">

	      <div style="width: 900px; overflow: hidden; margin-left: 85px; display: grid;">	        
	        <div style="display: flex; float: left;">
	          <font style="font-size: 30px; font-family: 'Rubik', sans-serif; padding-bottom: 10px;">결제내역</font>
	        </div>
	        <hr>
	        <c:forEach var="dto" items="${list}">
	        <div class="section-title" style="padding-bottom: 10px;">
              <p><a href="lectureInfo.do?lectureNum=${dto.lectureNum}">${dto.subject}</a></p>                            
            </div>
            
            <div>
              <font>강의 날짜</font>
            </div>
            <div>
              <c:if test="${dto.time==1}">
                ${dto.date1} ${dto.time1_1}~${dto.time1_2}
              </c:if>
              <c:if test="${dto.time==2}">
                ${dto.date2} ${dto.time2_1}~${dto.time2_2}
              </c:if>
              <c:if test="${dto.time==3}">
                ${dto.date3} ${dto.time3_1}~${dto.time3_2}
              </c:if>
            </div>
            
            <div>
              <font>강의비</font>
            </div>
            <div>
              <fmt:formatNumber type="currency" value="${dto.payPrice}" />원
            </div>
            <div>
              <font>결제일</font>
            </div>
            <div>
              ${dto.payDate}
            </div>
            <hr>
            </c:forEach>
	      </div>
	      
	    </div>
      </div>  
    </div>

  </main>

<%@ include file="/WEB-INF/views/main/bottom.jsp"%>