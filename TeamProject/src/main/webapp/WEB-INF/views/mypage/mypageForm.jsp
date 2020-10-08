<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
	      
	      <c:if test="${level == '1'}">   
	      <div style="width: 900px; overflow: hidden; margin-left: 85px; display: grid;">	        
	        <div style="display: flex; float: left;">
	          <font style="font-size: 30px; font-family: 'Rubik', sans-serif; padding-bottom: 10px;">내 프로필</font>
	        </div>
	        <hr>
	        <c:forEach var="dto" items="${mTutor}">
	        <div class="section-title" style="padding-bottom: 10px;">
              <div class="profile">
                <p><img src="${pageContext.request.contextPath}\resources\ckUpload/${dto.filename_face}"></p>
              </div>                             
            </div>
            <hr>
            </c:forEach>
	        <div>
	          <div style="float: left; width: 20%; padding: 10px;">
	            <label class="grouplabel4">아이디</label>
	          </div>
	          <div style="float: left; width: 33%; padding: 10px;">
	            <font class="subjectContent">${getUserPage.userEmail}</font>	         
	          </div>
	        </div>
	        <hr>
	        <c:forEach var="dto" items="${mTutor}">
	        <div>
	          <div style="float: left; width: 20%; padding: 10px;">
	            <label class="grouplabel4">닉네임</label>
	          </div>
	          <div style="float: left; width: 33%; padding: 10px;">
	            <font class="subjectContent">${dto.tutorNickName}</font>	         
	          </div>
	        </div>
	        <hr>
	        <div>
	          <div style="float: left; width: 20%; padding: 10px;">
	            <label class="grouplabel4">튜터등록일</label>
	          </div>
	          <div style="float: left; width: 33%; padding: 10px;">
	            <font class="subjectContent">${dto.tutorDate}</font>	         
	          </div>
	        </div>
	        <hr>
	        <div>
	          <div style="float: left; width: 20%; padding: 10px;">
	            <label class="grouplabel4">분야</label>
	          </div>
	          <div class="major" style="float: left; width: 20%; padding: 10px;">
	            <font class="subjectContent">${dto.tutorMajor}</font>
	          </div>
	          <div class="major" style="float: left; width: 33%; padding: 10px;">
	            <a href="updateTmajor.do?tutorNum=${dto.tutorNum}&userNum=${dto.userNum}" onclick="window.open(this.href,'팝업창','width=300, height=200'); return false;">추가</a>
	            <script type="text/javascript">
			    	function popupOpen(){
			      	  url = "updateTmajor.do?tutorNum=${dto.tutorNum}&userNum=${dto.userNum}";
			      	  name = "팝업";
			      	  specs = "width=800,height=400,top=200,left=100,toolbar=no,menubar=no,scrollbars=no,resizable=yes";
			      	  window.open(url, name, specs);
			       	 return false;
			  		}
			    </script>
	          </div>
	        </div>
	        <hr>
	        </c:forEach>
	        <div>
	          <div style="float: left; width: 20%; padding: 10px;">
	            <label class="grouplabel4">전화번호</label>
	          </div>
	          <div class="phonebutton" style="float: left; width: 33%; padding: 10px;">
	            <font class="subjectContent">${getUserPage.userPhone}</font>
	            <button onclick="location.href='Phone.do?userNum=${getUserPage.userNum}'">번호 수정</button>	         
	          </div>
	        </div>
	        <hr>
	        <div>
	          <div style="float: left; width: 20%; padding: 10px;">
	            <label class="grouplabel4">이름</label>
	          </div>
	          <div style="float: left; width: 33%; padding: 10px;">
	            <font class="subjectContent">${getUserPage.userName}</font>	         
	          </div>
	        </div>
	        <hr>
	        <div class="subjectMain">
	          <font></font>
	        </div>
	        <div class="subjectListButton" style="margin-top: 10px;">
	          <button class="btntn" onclick="location.href='myPageLecture.do?userNum=${getUserPage.userNum}'">결제내역</button>
	          <button class="btntn" onclick="location.href='myPageCart.do?userNum=${getUserPage.userNum}'">찜목록</button>
	        </div>
	      </div>
	      </c:if>
	      
	      
	      <c:if test="${level == '0'}">
	      <div style="width: 900px; overflow: hidden; margin-left: 85px; display: grid;">
	        <div style="display: flex; float: left;">
	          <font style="font-size: 30px; font-family: 'Rubik', sans-serif; padding-bottom: 10px;">내 프로필</font>
	        </div>
	        <hr>
	        <div>
	          <div style="float: left; width: 20%; padding: 10px;">
	            <label class="grouplabel4">아이디</label>
	          </div>
	          <div style="float: left; width: 33%; padding: 10px;">
	            <font class="subjectContent">${getUserPage.userEmail}</font>	         
	          </div>
	        </div>
	        <hr>
	        <div>
	          <div style="float: left; width: 20%; padding: 10px;">
	            <label class="grouplabel4">전화번호</label>
	          </div>
	          <div class="phonebutton" style="float: left; width: 33%; padding: 10px;">
	            <font class="subjectContent">${getUserPage.userPhone}</font>
	            <button onclick="location.href='Phone.do?userNum=${getUserPage.userNum}'">번호 수정</button>
	          </div>
	        </div>
	        <hr>
	        <div>
	          <div style="float: left; width: 20%; padding: 10px;">
	            <label class="grouplabel4">이름</label>
	          </div>
	          <div style="float: left; width: 33%; padding: 10px;">
	            <font class="subjectContent">${getUserPage.userName}</font>	         
	          </div>
	        </div>
	        <hr>
	        <div class="subjectMain">
	          <font></font>
	        </div>
	        <div class="subjectListButton" style="margin-top: 10px;">
	          <button class="btntn" onclick="location.href='myPageLecture.do?userNum=${getUserPage.userNum}'">결제내역</button>
	          <button class="btntn" onclick="location.href='myPageCart.do?userNum=${getUserPage.userNum}'">찜목록</button>
	        </div>
	      </div>
	      </c:if>
		  
	    </div>
      </div>
    </div>
    
    <div align="center">
<a href="mainForm.do">main</a>
<table width="800" border="1">
<tr>
<th>튜터번호</th>
<th>닉네임</th>
<th>분야</th>
<th>날짜</th>
<th>승인여부</th>
</tr>
<c:if test="${empty tutorList2}">		
		<tr>
			<td colspan="6">
				등록된 게시글이 없습니다.
			</td>
		</tr>
	</c:if>
<c:forEach var="dto" items="${tutorList2}">
<tr>
<td>${dto.tutorNum}</td>
<td><a href="tutorContent.do?tutorNum=${dto.tutorNum }">${dto.tutorNickName }</a></td>
<td>${dto.tutorMajor }</td>
<td>${dto.tutorDate }</td>
<td align="center">
<c:choose>
<c:when test="${dto.tutorLevel == 0 }">
대기중
</c:when>
<c:when test="${dto.tutorLevel == 1}">
OK
</c:when>
<c:otherwise>
거절
</c:otherwise>
</c:choose>
</td>
</tr>
</c:forEach>
</table>
</div>
  
  </main>
  
<%@ include file="/WEB-INF/views/main/bottom.jsp"%>