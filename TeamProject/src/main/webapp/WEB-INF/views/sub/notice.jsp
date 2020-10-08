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
	      
	      <div style="display: grid; grid-template-columns: 33% 33% 34%; padding: 0 0 50px 0; text-align: center;">
	        <div style="border-right: 1px solid #eee;">
	          <font style="font-size: 19px; font-family: 'Rubik', sans-serif;">Tel.1544-1515</font><br>
	          <font style="font-size: 12px; color: #a7a7a7;">평일 9:00~18:00(점심 12:00~13:00)</font>
	        </div>
	        <div style="border-right: 1px solid #eee;">
	          <a href="#" onclick="checkLogin()" style="color: black;"><font style="font-size: 19px; font-family: 'Rubik', sans-serif;">1:1 Q&amp;A</font></a><br>
	          <font style="font-size: 12px; color: #a7a7a7;">질문 전 FAQ(자주 묻는 질문)을 먼저 확인해 주세요.</font>
	        </div>
	        <div>
	          <a href="inquiryFAQ.do" style="color: black;"><font style="font-size: 19px; font-family: 'Rubik', sans-serif;">FAQ</font></a><br>
	          <font style="font-size: 12px; color: #a7a7a7;">자주 묻는 질문</font>
	        </div>
	      </div>
	      
	      <div class="section-title">
            <h2></h2>
            <p></p>
          </div>
	      
	      <div style="display: flex; float: left;">
	        <font style="font-size: 30px; font-family: 'Rubik', sans-serif;">Notice</font>&nbsp;&nbsp;&nbsp;
	        <font style="margin-top: 18px; font-size: 12px;">총 게시글 수 : &nbsp;<b>${map.count}</b></font>
	      </div>
	      
	      <!-- 검색란 -->
	      <div style="display: flex; float: right" class="searchDiv2">
	        <form name="form1" method="post" action="listNotice.do" style="display: contents">
              <select name="searchOption" id="searchSelect">
                <option value="all" <c:out value="${map.searchOption == 'all'?'selected':''}"/>>전체</option>
                <option value="writer" <c:out value="${map.searchOption == 'writer'?'selected':''}"/>>작성자</option>
                <option value="subject" <c:out value="${map.searchOption == 'subject'?'selected':''}"/>>내용</option>
              </select>
              <input name="keyword" value="${map.keyword}" id="searchText">
              <input type="submit" value="검색" id="searchButton">
	        </form>
	      </div>
	    
		  <div class="table">

		    <div class="row header">
			  <div class="cell" style="width: 10%;">
			    No.1
			  </div>
			  <div class="cell" style="width: 70%; text-align: center;">
			      내용
		      </div>
		      <div class="cell" style="width: 12%;">
			      작성자
		      </div>
			  <div class="cell" style="width: 8%;">
			      등록일
			  </div>
		    </div>

            <c:forEach var="dto" items="${map.listNotice}">
			<div class="row">
			  <div class="cell" data-title="num">
			    ${dto.num}
			  </div>
			  <div class="cell" data-title="subject">
			    <a href="content_notice.do?num=${dto.num}">${dto.subject}</a>
			  </div>
			  <div class="cell" data-title="writer">
			    <c:if test="${dto.writer == (userLevel == 2)}">
			         관리자
			    </c:if>
			  </div>
			  <div class="cell" data-title="userEmail" id="userEmail">
				${dto.notice_date}
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