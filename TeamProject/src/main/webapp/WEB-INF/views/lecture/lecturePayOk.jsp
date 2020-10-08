<%@ page language="java" pageEncoding="utf-8"%>

<%@ include file="/WEB-INF/views/main/top.jsp" %>

<body>
<h2>결제완료</h2>
<br>

이름 : ${usersDTO.userName}<br>
강의명 : ${lectureDTO.subject}<br>
강의 일자 : ${payDTO.time}<br>
결제 금액 : ${payDTO.payPrice}<br>
결제 일자 : ${payDTO.payDate}<br>

<button onclick="location.href='lectureInfo.do?lectureNum=${payDTO.lectureNum}'">상세페이지로 가기</button>  
<button onclick="location.href='myPageCheck.do'">마이페이지로 가기</button>

</body>

<%@ include file="/WEB-INF/views/main/bottom.jsp" %>