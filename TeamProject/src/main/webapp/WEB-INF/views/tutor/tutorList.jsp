<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="/WEB-INF/views/main/top.jsp"%>

  <!-- 회원관리 테이블 CSS File -->
  <link href="${pageContext.request.contextPath}/resources/admin/member/images/icons/favicon.ico?after" rel="icon">
  <link href="${pageContext.request.contextPath}/resources/admin/member/main.css?after" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/admin/member/util.css?after" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/admin/member/page.css?after" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/admin/member/search.css?after" rel="stylesheet">

  <main id="main">  
    
    <div class="limiter">
      <div class="container-table100">      
	    <div class="wrap-table100" style="width: 797px;">
	      
	      <div class="subCount" style="display: flex; float: left; margin-top: 10px;">
	        <font>총 회원 수 : <b style="color: #ff7600;">${map.count}</b></font> &nbsp;&nbsp;&nbsp;
	      </div>
	      
	      <!-- 검색란 -->
	      <div style="display: flex; float: right" class="searchDiv">
	        <form name="form1" method="post" action="tutorList.do" style="display: contents">
              <select name="searchOption" id="searchSelect">
                <option value="all" <c:out value="${map.searchOption == 'all'?'selected':''}"/>>전체</option>
                <option value="tutorNum" <c:out value="${map.searchOption == 'tutorNum'?'selected':''}"/>>이름</option>
              </select>
              <input name="keyword" value="${map.keyword}" id="searchText">
              <input type="submit" value="검색" id="searchButton">      
	        </form>
	      </div>
	    
		  <div class="table">

		    <div class="row header">
			  <div class="cell" style="width: 8%;">
			    <font>No.1</font>
			  </div>
			  <div class="cell" style="width: 74%; text-align: center;">
			    <font>이름</font>
		      </div>
			  <div class="cell" style="width: 9%;">
			    <font>구분</font>
			  </div>
		    </div>

            <c:forEach var="dto" items="${map.tutorList}">
			<div class="row">
			  <div class="cell" data-title="tutorNum">
			    ${dto.tutorNum}
			  </div>
			  <div class="cell" data-title="tutorName" style="text-align: center;">
			    <a href="tutorContent.do?tutorNum=${dto.tutorNum}" onclick="window.open(this.href,'팝업창','width=700, height=800'); return false;">${dto.tutorNickName}</a>
			    <script type="text/javascript">
			    	function popupOpen(){
			           url = "tutorContent.do";
			           name = "팝업";
			           specs = "width=800,height=400,top=200,left=100,toolbar=no,menubar=no,scrollbars=no,resizable=yes";
			           window.open(url, name, specs);
			           return false;
			    	}
			    </script>
			  </div>
			  
			  <c:if test="${dto.tutorLevel == 0}">
			  <div class="cell" data-title="tutorLevel">
				대기중
			  </div>
			  </c:if>
			  <c:if test="${dto.tutorLevel == 1}">
			  <div class="cell" data-title="tutorLevel">
				승인
			  </div>
			  </c:if>
			  <c:if test="${dto.tutorLevel == 2}">
			  <div class="cell" data-title="tutorLevel">
				거절
			  </div>
			  </c:if>
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