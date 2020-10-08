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
	        <font style="font-size: 30px; font-family: 'Rubik', sans-serif;">Notice</font>&nbsp;&nbsp;&nbsp;
	        <font style="margin-top: 18px; font-size: 12px;">총 게시글 수 : &nbsp;<b>${map.count}</b></font>
	      </div>
	      
	      <!-- 검색란 -->
	      <div style="display: flex; float: right" class="searchDiv2">
	        <form name="form1" method="post" action="adminListNotice.do" style="display: contents">
              <select name="searchOption" id="searchSelect">
                <%-- <option value="all" <c:out value="${map.searchOption == 'all'?'selected':''}"/>>전체</option>
                <option value="subject" <c:out value="${map.searchOption == 'subject'?'selected':''}"/>>작성자</option>
                <option value="content" <c:out value="${map.searchOption == 'content'?'selected':''}"/>>내용</option> --%>
                <option value="all">전체</option>
                <option value="subject">작성자</option>
                <option value="content">내용</option>
              </select>
              <input name="keyword" id="searchText">
              <input type="submit" value="검색" id="searchButton">
	        </form>
	      </div>
	    
		  <div class="table">

		    <div class="row header">
			  <div class="cell" style="width: 10%;">
			    No.1
			  </div>
			  <div class="cell" style="width: 72%; text-align: center;">
			      제목
		      </div>
			  <div class="cell" style="width: 12%;">
			      등록일
			  </div>
			  <div class="cell" style="width: 6%;">
			      삭제
			  </div>
		    </div>

            <c:forEach var="dto" items="${map.listNotice}">
			<div class="row">
			  <div class="cell" data-title="userNum">
			    ${dto.num}
			  </div>
			  <div class="cell" data-title="userName">
			    <a href="adminContent_notice.do?num=${dto.num}">${dto.subject}</a>
			  </div>
			  <div class="cell" data-title="userEmail" id="userEmail">
				${dto.notice_date}
			  </div>
			  <div class="cell">
				<a href="delete_notice.do?num=${dto.num}"><strong>삭제</strong></a>
			  </div>
			</div>
			</c:forEach>			

		  </div>
		  
		  <div style="float: right; margin-top: 5px;" id="writeCell">
			<a href="noticeForm.do">글쓰기</a>
		  </div>
		  
		  <!-- 페이징 -->
		  <div class="hoverPagination" id="roundBorder">
			<c:if test="${map.memberPager.curPage <= map.memberPager.totPage}">
			  <a href="javascript:noticelist('1')">«</a>
			</c:if>
			<c:if test="${map.memberPager.curPage > 1}">
			  <a href="javascript:noticelist('${map.memberPager.prevPage}')">＜</a>
			</c:if>
			<c:forEach var="num" begin="${map.memberPager.blockBegin}" end="${map.memberPager.blockEnd}">
			  <c:choose>
			    <c:when test="${num == map.memberPager.curPage}">
			      <span style="color: red;">${num}</span>
			    </c:when>
			    <c:otherwise>
			      <a href="javascript:noticelist('${num}')">${num}</a>
			    </c:otherwise>
			  </c:choose>
			</c:forEach>
		    <c:if test="${map.memberPager.curPage ne map.memberPager.totPage && map.memberPager.totPage > 0}">
			  <a href="javascript:noticelist('${map.memberPager.nextPage}')">＞</a>
			</c:if>
		    <c:if test="${map.memberPager.curPage <= map.memberPager.totPage}">
			  <a href="javascript:noticelist('${map.memberPager.totPage}')">»</a>
		    </c:if>
		  </div>
		  
	    </div>
      </div>
    </div>
  
  </main>

<%@ include file="bottom.jsp"%>