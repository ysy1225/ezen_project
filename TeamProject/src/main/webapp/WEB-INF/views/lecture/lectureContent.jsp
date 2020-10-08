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
	    
	      <div style="width: 765px;">
          <div id="wrapper">
            <div id="slider-wrap">
              <ul id="slider">
                <c:set var = "file" value="${fn:split(dto.filename,',')}"/>
                
                <c:forEach var="ffile" items="${file}" varStatus="f">
                <li>                  
                  <%-- <c:if test="${f.setp}"> --%>
                  <img src="${pageContext.request.contextPath}\resources\ckUpload/lecture/${ffile}">
                  <%-- </c:if> --%>                                   
                </li>
                </c:forEach> 
                
                <%-- <li>
                  <c:forEach var="ffile" items="${file}" varStatus="f">
                  <c:if test="${f.count == 1}">
                  <img src="${pageContext.request.contextPath}\resources\ckUpload/lecture/${ffile}">
                  </c:if>
                  </c:forEach>                  
                </li>
                             
                <li>
                  <c:forEach var="ffile" items="${file}" varStatus="f">
                  <c:if test="${f.count == 2}">
                  <img src="${pageContext.request.contextPath}\resources\ckUpload/lecture/${ffile}">
                  </c:if>
                  </c:forEach>
                </li>
             
                <li>
                  <c:forEach var="ffile" items="${file}" varStatus="f">
                  <c:if test="${f.count == 3}">
                  <img src="${pageContext.request.contextPath}\resources\ckUpload/lecture/${ffile}">
                  </c:if>
                  </c:forEach>
                </li> --%>
                
              </ul>
          
              <!--controls-->
              <div class="btns" id="next"><i class="fa fa-arrow-right"></i></div>
              <div class="btns" id="previous"><i class="fa fa-arrow-left"></i></div>
              <div id="counter"></div>
          
              <div id="pagination-wrap">
                <ul></ul>
              </div>
              <!--controls-->                   
            </div>
          </div>
          
          <div id="메뉴폼">
          <div id="메뉴">
          	<div>
          	  <a href="#요약">요약</a>
          	</div>
          	<div>
          	  <a href="#튜터">튜터</a>
          	</div>
          	<div>
          	  <a href="#수업소개">수업소개</a>
          	</div>
          	<div>
          	  <a href="#">리뷰</a>
          	</div>
          </div>
          </div>
          
          <hr>
          
          <div id="요약">
          <div id="튜터프로필">
            <div class="profile">
            <img src="${pageContext.request.contextPath}\resources\ckUpload/${dto1.filename_face}">
            </div>
          </div>
          <div id="강의제목">
            ${dto.subject}
          </div>
          </div>
          
          <hr>
          
          <div id="튜터"></div>
          <div>
          <div>
            <h4>튜터 정보</h4>
            <div>
              ${dto.tutors}
            </div>
          </div>
          </div>
          
          <hr>
          
          <div id="수업소개">
          <div id="#">
            <h4>수업 소개</h4>
            <div>
              ${dto.content}
            </div>
          </div>
          </div>
	      
	      <hr>
	      
	      <div id="리뷰">
          <div id="#">
            <h4>리뷰</h4>
            <div>
              <c:if test="${review eq null }">
                <font>리뷰 없음</font>
              </c:if>
              <c:choose>
                <c:when test="${mbId eq null }">
                  <font>로그인 하세요.</font>
                </c:when>
                <c:otherwise>
                <c:if test="${userRev == 0 && URP == 1}">
                  <form action="revInput.do" method="post">
                    <input type="hidden" name="userNum" value="${getUserNum}">
                    <input type="hidden" name="lectureNum" value="${dto.lectureNum }">
                    <div>
                      <select name="star">
                        <option value="5">★★★★★</option>
                        <option value="4">★★★★☆</option>
                        <option value="3">★★★☆☆</option>
                        <option value="2">★★☆☆☆</option>
                        <option value="1">★☆☆☆☆</option>
                      </select>
                    </div>
                    <div>
                      <textarea rows="5" cols="30" name="revContent"></textarea>
                    </div>
                    <div>
                      <input type="submit" value="리뷰 작성">
                    </div>
                  </form>
                </c:if>
                </c:otherwise>
              </c:choose>
            </div>
          </div>
          </div>
	      
	      <div class="aa">
            <c:if test="${avgStar ne null }">
              <c:if test="${avgStar-(avgStar%1) == 1 }">
                <td>★☆☆☆☆</td>
              </c:if>
              <c:if test="${avgStar-(avgStar%1) == 2 }">
                <td>★★☆☆☆</td>
              </c:if>
              <c:if test="${avgStar-(avgStar%1) == 3 }">
                <td>★★★☆☆</td>
              </c:if>
              <c:if test="${avgStar-(avgStar%1) == 4 }">
                <td>★★★★☆</td>
              </c:if>
              <c:if test="${avgStar-(avgStar%1) == 5 }">
                <td>★★★★★</td>
              </c:if>
              <fmt:formatNumber value="${avgStar}" pattern=".00"/>
            </c:if>
            <div>
              <table border="1" width="800" align="center">
          <c:forEach var="dto1" items="${review }">
            <tr>
            <c:if test="${dto1.star == 1 }">
              <td>★☆☆☆☆</td>
            </c:if>
            <c:if test="${dto1.star == 2 }">
              <td>★★☆☆☆</td>
            </c:if>
            <c:if test="${dto1.star == 3 }">
              <td>★★★☆☆</td>
            </c:if>
            <c:if test="${dto1.star == 4 }">
              <td>★★★★☆</td>
            </c:if>
            <c:if test="${dto1.star == 5 }">
              <td>★★★★★</td>
            </c:if>     
            <c:if test="${dto1.userName eq null }">
            <td>이미 탈퇴한 계정</td>
            </c:if>           
              <c:if test="${dto1.userName ne null }">    
              <td>${dto1.userName }</td>
              </c:if>
              <td>${dto1.revContent }</td>
              <td>${dto1.revDate }
              <c:if test="${dto1.userNum eq getUserNum }">
                <a href="updateRevForm.do?revNum=${dto1.revNum }&lectureNum=${dto.lectureNum}">수정</a>/
                <a href="deleteRev.do?revNum=${dto1.revNum }&lectureNum=${dto.lectureNum}">삭제</a>
              </c:if>
              </td>  
            </tr>
          </c:forEach>
          </table>
            </div>
          </div>
          </div>
          
          <div class="pay">
            <div class="payForm">
              <font>원데이 클래스</font>
              
              <hr>
              <c:if test="${dto.lecLevel eq 0 }">
              <c:if test="${date1 != null || dto.time1_1 != null || dto.time1_2 != null}"> 
              <div style="display: flex; font-size: 14px;">
                <div style="margin-right: 20px;">${date1}</div>
                <div>${dto.time1_1}</div>~
                <div style="margin-right: 20px;">${dto.time1_2}</div>
                <div>${dto.location1}</div>&nbsp;
                <div>${dto.location2}</div>
              </div>
              <hr>
              </c:if>             
              
              <c:if test="${date2 != null || dto.time2_1 != null || dto.time2_2 != null}"> 
              <div style="display: flex; font-size: 14px;">
                <div style="margin-right: 20px;">${date2}</div>
                <div>${dto.time2_1}</div>~
                <div style="margin-right: 20px;">${dto.time2_2}</div>
                <div>${dto.location1}</div>&nbsp;
                <div>${dto.location2}</div>
              </div>
              <hr>
              </c:if>
              
              <c:if test="${date3 != null || dto.time3_1 != null || dto.time3_2 != null}"> 
              <div style="display: flex; font-size: 14px;">
                <div style="margin-right: 20px;">${date3}</div>
                <div>${dto.time3_1}</div>~
                <div style="margin-right: 20px;">${dto.time3_2}</div>
                <div>${dto.location1}</div>&nbsp;
                <div>${dto.location2}</div>
              </div>
              <hr>
              </c:if>
              
              <div>
                <div>
                  <b><fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${dto.price}" />원</b> / 시간
                </div>
                <div>
                  <b><fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${dto.price*hour}" />원</b> / 총 ${count2}회 ${hour}시간
                </div>
              </div>
              
              <a href="payApply.do?lectureNum=${dto.lectureNum}">수업 신청하기</a>
              <button onclick="javascript:checkLogin2('${mbId}','${dto.lectureNum}')">찜하기</button>
               <c:if test="${getUserNum eq dto.userNum}">
	              	<a href="lectureUpdate.do?lectureNum=${dto.lectureNum}">수정하기</a>
	              	<a href="lectureClose.do?lectureNum=${dto.lectureNum}">종료하기</a>
              </c:if>
              </c:if>
              <c:if test="${dto.lecLevel eq 1 }">
              	이미 종료된 강의입니다.
              </c:if>
              <script type="text/javascript">
                function checkLogin2(id,lectureNum) {            		
            	  if (id == null) {
            	    alert("로그인을 해주세요")
            	    return false
                  } else {
            	    location.href="cartInput.do?lectureNum=" + lectureNum;
                  }
            	}
              </script>
              
            </div>
          </div>
		  
	    </div>
      </div>
    </div>
  
  </main>

<%@ include file="/WEB-INF/views/main/bottom.jsp"%>