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
	    <div class="wrap-table100">
	    
	      <div class="subCount" style="display: flex; float: left; margin-top: 10px;">
	        <font>정지 회원 수 : <b style="color: #ff7600;">${map.count}</b></font> &nbsp;&nbsp;&nbsp;
	        <div style="margin-top: -5px;">
	        <a href="memberList.do">돌아가기</a>
	        </div>
	      </div>
	      
	      <!-- 검색란 -->
	      <div style="display: flex; float: right" class="searchDiv">
	        <form name="form1" method="post" action="blockMemberList.do" style="display: contents">
              <select name="searchOption" id="searchSelect">
                <option value="all" <c:out value="${map.searchOption == 'all'?'selected':''}"/>>전체</option>
                <option value="userName" <c:out value="${map.searchOption == 'userName'?'selected':''}"/>>이름</option>
                <option value="userEmail" <c:out value="${map.searchOption == 'userEmail'?'selected':''}"/>>이메일</option>
                <option value="userPhone" <c:out value="${map.searchOption == 'userPhone'?'selected':''}"/>>휴대전화</option>
              </select>
              <input name="keyword" value="${map.keyword}" id="searchText">
              <input type="submit" value="검색" id="searchButton">      
	        </form>
	      </div>
	    
		  <div class="table">

		    <div class="row header">
			  <div class="cell" style="width: 12%;">
			    No.1
			  </div>
			  <div class="cell" style="width: 11%;">
			      이름
		      </div>
			  <div class="cell" style="width: 22%;">
			      아이디
			  </div>
			  <div class="cell" style="width: 14%;">
				휴대전화
			  </div>
			  <div class="cell" style="width: 18%;">
				가입일자
			  </div>
			  <div class="cell" style="width: 12%;">
				구분
			  </div>
			  <div class="cell" style="width: 11%;">
				허용 / 탈퇴
			  </div>
		    </div>

            <c:forEach var="dto" items="${map.blockMemberList}">
			<div class="row">
			  <div class="cell" data-title="userNum">
			    ${dto.userNum}
			  </div>
			  <div class="cell" data-title="userName">
			    ${dto.userName}
			  </div>
			  <div class="cell" data-title="userEmail">
				${dto.userEmail}
			  </div>
			  <div class="cell" data-title="userPhone">
				${dto.userPhone}
			  </div>
			  <div class="cell" data-title="userRegdate">
				${dto.userRegdate}
			  </div>
			  <c:if test="${dto.userLevel == 0}">
			  <div class="cell" data-title="userLevel">
				일반 회원
			  </div>
			  </c:if>
			  <c:if test="${dto.userLevel == 1}">
			  <div class="cell" data-title="userLevel">
				튜터 회원
			  </div>
			  </c:if>
			  <c:if test="${dto.userLevel == 2}">
			  <div class="cell" data-title="userLevel">
				관리자
			  </div>
			  </c:if>
			  <div class="cell" data-title="userBlock" id="cellBlock">
			    <a href="adminAllow.do?userNum=${dto.userNum}" onclick="return checkAllow()">허용</a> 
			    <a href="adminDelete.do?userNum=${dto.userNum}" onclick="return checkDelete()">탈퇴</a>
			  </div>
			  <script type="text/javascript">
				function checkDelete() {
					var i = confirm("삭제하시겠습니까?");
					if(i){
						return true;
					}else{
						return false;
					}
				}
				function checkAllow() {
					var i = confirm("허용시키겠습니까?");
					if(i){
						return true;
					}else{
						return false;
					}
				}
			</script>
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