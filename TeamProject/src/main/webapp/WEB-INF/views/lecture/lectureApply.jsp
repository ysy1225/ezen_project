<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@ include file="/WEB-INF/views/main/top.jsp"%>
  
  <link href="${pageContext.request.contextPath}/resources/admin/member/main.css?after" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/admin/member/util.css?after" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/slider.css?after" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/grid.css?after" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/main/profile.css?after" rel="stylesheet">
  <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">

  <main id="main">
  
    <div class="limiter">
      <div class="container-table100">      
	    <div class="wrap-table100" style="display: grid;
                                          grid-template-columns: repeat(2, 1fr);">
	      
	      <form method="post" id="f" <%-- onsubmit="return checkLogin(${mbId});return checkRadio();" --%>>
          <div class="pay">
            <div class="payForm">
              <font>원데이 클래스</font>
              
              <hr>
              
              <c:if test="${date1 != null || dto.time1_1 != null || dto.time1_2 != null}"> 
              <div style="display: flex; font-size: 14px;">
                <input type="radio" name="time" value="1" id="date1">
                <div style="margin-right: 20px;">${date1}</div>
                <div>${dto.time1_1}</div>~
                <div style="margin-right: 20px;">${dto.time1_2}</div>
                <div>${dto.location1}</div>
                <div>${dto.location2}</div>
              </div>
              <hr>
              </c:if>             
              
              <c:if test="${date2 != null || dto.time2_1 != null || dto.time2_2 != null}"> 
              <div style="display: flex; font-size: 14px;">
                <input type="radio" name="time" value="2" id="date2">
                <div style="margin-right: 20px;">${date2}</div>
                <div>${dto.time2_1}</div>~
                <div style="margin-right: 20px;">${dto.time2_2}</div>
                <div>${dto.location1}</div>
                <div>${dto.location2}</div>
              </div>
              <hr>
              </c:if>
              
              <c:if test="${date3 != null || dto.time3_1 != null || dto.time3_2 != null}"> 
              <div style="display: flex; font-size: 14px;">
                <input type="radio" name="time" value="3" id="date3">
                <div style="margin-right: 20px;">${date3}</div>
                <div>${dto.time3_1}</div>~
                <div style="margin-right: 20px;">${dto.time3_2}</div>
                <div>${dto.location1}</div>
                <div>${dto.location2}</div>
              </div>
              <hr>
              </c:if>
              
              <b><fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${dto.price}" />원</b> / 시간<br>
              <b><fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${dto.price*hour}" />원</b> / 총 1회 ${hour}시간<br>
              <input type="hidden" name="lectureNum" value="${dto.lectureNum}">
              <input type="hidden" name="payPrice" value="${dto.price*hour}">
              <input type="button" value="카카오결제" id="btn1" formaction="lectureKakao.do">
              <input type="button" value="다날결제" id="btn2" formaction="lectureInicis.do">
              
            </div>
          </div>
          </form>
          
          <script type="text/javascript">
            window.onload = function() {
              document.getElementById('btn1').onclick = function() {
            	document.getElementById('f').submit();
                var id = '${mbId}';
                var radio = document.getElementsByName('time');
                var radio_cnt = 0;
                
                if (id == '') {
          			alert("로그인이 필요합니다.");
          			location.href = 'loginForm.do';
          		} else {
          			for(var i=0; i<radio.length;i++){
          				if(radio[i].checked == true)radio_cnt++;
          			}
          			if(radio_cnt<1){
          				alert("시간을 선택해 주세요");
          				return false;
          			}else{
          				f.action='lectureKakao.do';
          				f.submit();
          			}
          		}
              };
              document.getElementById('btn2').onclick = function() {
              	document.getElementById('f').submit();
                  var id = '${mbId}';
                  var radio = document.getElementsByName('time');
                  var radio_cnt = 0;
                  
                  if (id == '') {
            			alert("로그인이 필요합니다.");
            			location.href = 'loginForm.do';
            		} else {
            			for(var i=0; i<radio.length;i++){
            				if(radio[i].checked == true)radio_cnt++;
            			}
            			if(radio_cnt<1){
            				alert("시간을 선택해 주세요");
            				return false;
            			}else{
            				f.action='lectureInicis.do';
            				f.submit();
            			}
            		}
                };
      	    };
          </script>
		  
	    </div>
      </div>
    </div>
  
  </main>

<%@ include file="/WEB-INF/views/main/bottom.jsp"%>