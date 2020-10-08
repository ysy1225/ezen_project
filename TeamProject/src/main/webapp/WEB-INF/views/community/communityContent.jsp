<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/main/top.jsp"%>

  <link href="${pageContext.request.contextPath}/resources/sub/lecture2.css?after" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/sub/comstyle.css?after" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/main/mainvendor/bootstrap/css/bootstrap-grid3.css" rel="stylesheet">
  
  <main id="main">
  
    <div class="limiter">
      <div class="container-table100">      
	    <div class="wrap-table100" style="margin: 200px 450px; justify-content: center;">
  
  <div>
    <a href="community.do" class="ntnbt">목록</a>
    <c:if test="${dto.userNum eq getUserNum }">
      <a href="updateComForm.do?comNum=${dto.comNum }" class="ntnbt">수정</a>
      <a href="deleteCom.do?comNum=${dto.comNum }" class="ntnbt">삭제</a>
    </c:if>
    
    <hr>
    
    <div>
      
      <div style="display: grid;">
    
      <div>
        <div id="wForm">
          <div id="wname">이름</div>
          <div style="float: left; margin-right: 40px;
                      margin-left: 10px;">${dto.userName }</div>
        </div>
        <div id="wForm">
          <div id="wname2">카테고리</div>
          <div style="float: left; margin-left: 13px;
                      margin-right: 36px;">${dto.comCate }</div>
        </div>       
        <div>
          <div id="wname">날짜</div>
          <div style="float: left; margin-left: 12px;">${dto.comDate }</div><br>
        </div>
      </div>
     
     <div style="margin-top: 40px;">
     <div>
       <div id="wname">제목</div>
       <div style="float: left; margin-left: 10px;">${dto.comSubject }</div>
     </div>
     </div>
     
     <div style="margin-top: 40px;">
       <div id="wname">내용</div>
       <div><textarea cols="90" rows="10" readOnly>${dto.comContent }</textarea></div>
     </div>
     
     <c:choose>
       <c:when test="${getUserNum eq dto.userNum }">
       <div style="display: flex; margin: 20px 0 0 70px;">
         <div><a href="#" class="btn btn-secondary rounded-circle btn-favorite text-gray-500"><ion-icon name="heart-circle-outline" style="margin-top: 8px; font-size: 20px;"></ion-icon></a> <font style="margin: 0 30px 0 10px;">${gCount}</font></div>
         <div><a href="#" class="btn btn-secondary rounded-circle btn-favorite text-gray-500"><ion-icon name="heart-dislike-circle-outline" style="margin-top: 8px; font-size: 20px;"></ion-icon></a><font style="margin: 0 0 0 10px;">${bCount}</font></div>
       </div>
       </c:when>
     <c:otherwise>     
       <div style="display: flex; margin: 20px 0 0 70px;">
         <div><a href="goodBad.do?userNum=${getUserNum }&comNum=${dto.comNum }&gb=good" class="btn btn-secondary rounded-circle btn-favorite text-gray-500"><ion-icon name="heart-circle-outline" style="margin-top: 8px; font-size: 20px;"></ion-icon> </a><font style="margin: 0 30px 0 10px;">${gCount}</font></div>
         <div><a href="goodBad.do?userNum=${getUserNum }&comNum=${dto.comNum }&gb=bad" class="btn btn-secondary rounded-circle btn-favorite text-gray-500"><ion-icon name="heart-dislike-circle-outline" style="margin-top: 8px; font-size: 20px;"></ion-icon></a><font style="margin: 0 0 0 10px;">${bCount}</font></div>
       </div>
     </c:otherwise>
   </c:choose>
   </div>
   </div>
   </div>

   <hr>
   
   <h4>댓글</h4>
   <form action="insertComment.do" method="post">
     <input type="hidden" value="${getUserNum }" name="userNum">
     <input type="hidden" value="${dto.comNum }" name="comNum">
     <input type="hidden" value="${getN }" name="userName">
     <textarea rows="3" cols="110" name="content"></textarea>
     <input type="submit" value="작성" style="vertical-align: bottom;">
   </form>
<table width="1000" style="margin-top: 20px;">
<tr>
<th width="90">이름</th>
<th width="500">내용</th>
<th>날짜</th>
</tr>
<c:forEach var="dto" items="${comment }">
<tr>
<td>${dto.userName }</td>
<td>${dto.content }</td>
<td>${dto.cmtDate }
<a href="updateCmt.do?cmtNum=${dto.cmtNum }">수정</a>||
<a href="deleteCmt.do?cmtNum=${dto.cmtNum }&comNum=${dto.comNum}">삭제</a>
</td>
</tr>
</c:forEach>
</table>
      
        </div>
      </div>
    </div>
   
  </main>

<%@ include file="bottom.jsp"%>