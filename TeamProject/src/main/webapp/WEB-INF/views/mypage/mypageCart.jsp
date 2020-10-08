<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@ include file="/WEB-INF/views/main/top.jsp"%>

  <!-- 로그인 CSS File -->
  <link href="${pageContext.request.contextPath}/resources/login/loginmain.css?after" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/login/loginutil.css?after" rel="stylesheet"> 

  <main id="main">
  
    <section id="featured-services" class="featured-services section-bg">
      <div class="container" style="margin-top: 200px;">
        
        <div class="leclist">
        <c:forEach var="dto" items="${list}">
          <div style="display: flex; min-height: 100vh;">
            <a href="lectureInfo.do?lectureNum=${dto.lectureNum}">
            <c:set var = "file" value="${fn:split(dto.filename,',')}"/>
            <c:forEach var="ffile" items="${file}" varStatus="f">
              <c:if test="${f.count == 1}">
                <div>
                  <img id="sumimg" src="${pageContext.request.contextPath}\resources\ckUpload/lecture/${ffile}" style="width: 300px;">
                </div>
              </c:if>
            </c:forEach>
            </a>
            <div class="post-entry-1-contents" style="margin-left: 30px;">
              <a href="lectureInfo.do?lectureNum=${dto.lectureNum}"><h2 style="font-size: 17px; font-weight: bold;">${dto.subject}</h2></a>
              <div>
                <font>튜터 : </font>${dto.name}
              </div>
              <div>
                ${dto.mainCate} > ${dto.subCate}
              </div>
              <div>
                ${dto.cartDate}
              </div>
            </div>
            </div>
          
        </c:forEach>
        </div>
      
      </div>
    </section>
  
  </main>

<%@ include file="/WEB-INF/views/main/bottom.jsp"%>