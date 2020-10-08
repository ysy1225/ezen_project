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
	      
	      <div style="display: flex; float: left;">
	        <font style="font-size: 30px; font-family: 'Rubik', sans-serif;">1:1Q&amp;A</font>&nbsp;&nbsp;&nbsp;
	        <font style="margin-top: 18px; font-size: 12px;">문의내역 : &nbsp;<b>${map.count}</b></font>
	      </div>
	      
	      <!-- 검색란 -->
	      <div style="display: flex; float: right" class="searchDiv2">
	        <form name="form1" method="post" action="inquiry.do" style="display: contents">
              <select name="searchOption" id="searchSelect">
                <option value="all" <c:out value="${map.searchOption == 'all'?'selected':''}"/>>전체</option>
                <option value="inqName" <c:out value="${map.searchOption == 'inqName'?'selected':''}"/>>이름</option>
                <option value="inqSubject" <c:out value="${map.searchOption == 'inqSubject'?'selected':''}"/>>제목</option>
                <option value="inqContent" <c:out value="${map.searchOption == 'inqContent'?'selected':''}"/>>내용</option>
              </select>
              <input name="keyword" value="${map.keyword}" id="searchText">
              <input type="submit" value="검색" id="searchButton">
	        </form>
	      </div>
	    
		  <div class="table">

		    <div class="row header">
			  <div class="cell" style="width: 15%;">
			    No.1
			  </div>
			  <div class="cell" style="width: 52%;" align="center">
			       제목
			  </div>
			  <div class="cell" style="width: 18%;">
			       작성일
			  </div>
			  <div class="cell" style="width: 15%; padding-left: 36px;">
			       처리상태
			  </div>
		    </div>

            <c:forEach var="dto" items="${map.listInquiry}">
			<div class="row">
			  <div class="cell" data-title="inqNum">
			    ${dto.inqNum}
			  </div>
			  <div class="cell" data-title="inqSubject">
			    <a href="inqContent.do?inqNum=${dto.inqNum}">${dto.inqSubject}</a>
			  </div>
			  <div class="cell" data-title="inqDate">
			    ${dto.inqDate}
			  </div>
			  <div class="cell" id="cellInquiry" data-title="inqOk" style="padding-left: 22px;">
				<c:if test="${dto.inqOk == 0}">
				  <font id="wait">대기중</font>
				</c:if>
				<c:if test="${dto.inqOk != 0}">
                  <font id="ok" style="margin-left: 8px;">완료</font>
                </c:if>
			    <a href="deleteInq.do?inqNum=${dto.inqNum}" onclick="return checkDelete()">삭제</a>			
			  </div>
			</div>
			</c:forEach>

		  </div>
		  
		  <!-- 페이징 -->
		  <div class="hoverPagination" id="roundBorder">
			<c:if test="${map.memberPager.curPage <= map.memberPager.totPage}">
			  <a href="javascript:list('1')">«</a>
			</c:if>
			<c:if test="${map.memberPager.curPage > 1}">
			  <a href="javascript:list('${map.memberPager.prevPage}')">＜</a>
			</c:if>
			<c:forEach var="num" begin="${map.memberPager.blockBegin}" end="${map.memberPager.blockEnd}">
			  <c:choose>
			    <c:when test="${num == map.memberPager.curPage}">
			      <span style="color: red;">${num}</span>
			    </c:when>
			    <c:otherwise>
			      <a href="javascript:list('${num}')">${num}</a>
			    </c:otherwise>
			  </c:choose>
			</c:forEach>
		    <c:if test="${map.memberPager.curPage ne map.memberPager.totPage && map.memberPager.totPage > 0}">
			  <a href="javascript:list('${map.memberPager.nextPage}')">＞</a>
			</c:if>
		    <c:if test="${map.memberPager.curPage <= map.memberPager.totPage}">
			  <a href="javascript:list('${map.memberPager.totPage}')">»</a>
		    </c:if>
	      </div>
		  
	    </div>
      </div>
    </div>
  
  </main>

<%@ include file="bottom.jsp"%>