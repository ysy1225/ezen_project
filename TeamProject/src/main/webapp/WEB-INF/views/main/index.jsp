<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@ include file="banner.jsp"%>

  <link href="${pageContext.request.contextPath}/resources/sub/lecture.css?after" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/main/card.css?after" rel="stylesheet">

  <main id="main">
  
    <!-- ======= 카테고리 ======= -->
    <section id="featured-services" class="featured-services section-bg">
      <div class="container">

        <div class="row no-gutters">
        
          <div class="col-lg-4 col-md-6 category">
            <div class="icon-box">
              <div class="icon"><ion-icon name="bug-outline" style="font-size: 20px;"></ion-icon></div>
              <h5 class="title"><a href="lectureAllList.do?mode=IT"><span class="underline--magical">IT</span></a></h5>
            </div>
          </div>
          <div class="col-lg-4 col-md-6 category">
            <div class="icon-box">
              <div class="icon"><ion-icon name="laptop-outline" style="font-size: 20px;"></ion-icon></div>
              <h5 class="title"><a href="lectureAllList.do?mode=design"><span class="underline--magical">디자인</span></a></h5>
            </div>
          </div>
          <div class="col-lg-4 col-md-6 category">
            <div class="icon-box">
              <div class="icon"><ion-icon name="flask-outline" style="font-size: 20px;"></ion-icon></div>
              <h5 class="title"><a href="lectureAllList.do?mode=beauty"><span class="underline--magical">뷰티</span></a></h5>
            </div>
          </div>
          <div class="col-lg-4 col-md-6 category">
            <div class="icon-box">
              <div class="icon"><ion-icon name="musical-notes-outline" style="font-size: 20px;"></ion-icon></div>
              <h5 class="title"><a href="lectureAllList.do?mode=music"><span class="underline--magical">음악</span></a></h5>
            </div>
          </div>
          <div class="col-lg-4 col-md-6 category">
            <div class="icon-box">
              <div class="icon"><ion-icon name="book-outline" style="font-size: 20px;"></ion-icon></div>
              <h5 class="title"><a href="lectureAllList.do?mode=ability"><span class="underline--magical">실무역량</span></a></h5>
            </div>
          </div>
          <div class="col-lg-4 col-md-6 category">
            <div class="icon-box">
              <div class="icon"><ion-icon name="language-outline" style="font-size: 20px;"></ion-icon></div>
              <h5 class="title"><a href="lectureAllList.do?mode=language"><span class="underline--magical">외국어</span></a></h5>
            </div>
          </div>
          <div class="col-lg-4 col-md-6 category">
            <div class="icon-box">
              <div class="icon"><ion-icon name="bicycle-outline" style="font-size: 20px;"></ion-icon></div>
              <h5 class="title"><a href="lectureAllList.do?mode=lifeStyle"><span class="underline--magical">라이프스타일</span></a></h5>
            </div>
          </div>
          <div class="col-lg-4 col-md-6 category">
            <div class="icon-box">
              <div class="icon"><ion-icon name="apps-outline" style="font-size: 20px;"></ion-icon></div>
              <h5 class="title"><a href="lectureAllList.do?mode=other"><span class="underline--magical">기타</span></a></h5>
            </div>
          </div>
          
        </div>

      </div>
    </section><!-- End 카테고리 -->

    <!-- ======= 리스트 나열 ======= -->
    <%-- <section id="about" class="about">
      <div class="container">

        <div class="section-title">
          <h2>MD 추천</h2>
          <p>금주 MD가 추천하는 튜터들과의 만남! 지금 바로 만나보세요.</p>
        </div>

        <div class="row">
        
          <div class="col-lg-4 col-md-6 mb-4">
            <div class="post-entry-1 h-100">
              <a href="#">
                <img src="${pageContext.request.contextPath}/resources/main/img/img_1.jpg" alt="Image" class="img-fluid">
              </a>
              <div class="post-entry-1-contents">                
                <h2><a href="single.html">자바 머신러닝 좀 더 쉽게 다가가보자</a></h2>
                <span class="meta d-inline-block mb-3">July 17, 2019 <span class="mx-2">by</span> <a href="#">Admin</a></span>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolores eos soluta, dolore harum molestias consectetur.</p>
              </div>
            </div>
          </div>
          
          <div class="col-lg-4 col-md-6 mb-4">
            <div class="post-entry-1 h-100">
              <a href="single.html">
                <img src="${pageContext.request.contextPath}/resources/main/img/img_2.jpg" alt="Image" class="img-fluid">
              </a>
              <div class="post-entry-1-contents">                
                <h2><a href="single.html">Lorem ipsum dolor sit amet</a></h2>
                <span class="meta d-inline-block mb-3">July 17, 2019 <span class="mx-2">by</span> <a href="#">Admin</a></span>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolores eos soluta, dolore harum molestias consectetur.</p>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 mb-4">
            <div class="post-entry-1 h-100">
              <a href="single.html">
                <img src="${pageContext.request.contextPath}/resources/main/img/img_3.jpg" alt="Image" class="img-fluid">
              </a>
              <div class="post-entry-1-contents">                
                <h2><a href="single.html">Lorem ipsum dolor sit amet</a></h2>
                <span class="meta d-inline-block mb-3">July 17, 2019 <span class="mx-2">by</span> <a href="#">Admin</a></span>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolores eos soluta, dolore harum molestias consectetur.</p>
              </div>
            </div>
          </div>
          
        </div>

      </div>
    </section> --%><!-- End About Us Section -->

    <!-- ======= Why Us Section ======= -->
    <section id="why-us" class="why-us">
      <div class="container">
      
        <div class="section-title">
          <h2>높은 리뷰 평점</h2>
          <p>핫한 튜터들과의 만남! 지금 바로 만나보세요.</p>
        </div>

        <div class="row" id="row">
            
          <%-- <c:forEach var="dto" items="${best }">
          <div class="col-lg-4 col-md-6 mb-4">
            <div class="post-entry-1 h-100">
              <a href="lectureInfo.do?lec=${dto.lec}">
                <c:set var = "file" value="${fn:split(dto.filename,',')}"/>
                <c:forEach var="ffile" items="${file}" varStatus="f">
                <c:if test="${f.count == 1}">
                  <img id="sumimg" src="${pageContext.request.contextPath}\resources\ckUpload/lecture/${ffile}">
                </c:if>
                </c:forEach>
              </a>
              <div class="post-entry-1-contents">                
                <h2><a href="single.html">${dto.lec }</a></h2>
                평점&nbsp;<span class="meta d-inline-block mb-3">${dto.avg }</span>
                <p>리뷰수&nbsp;${dto.co }</p>
              </div>
            </div>
          </div>
          </c:forEach> --%>
          
          <c:forEach var="dto" items="${best}">
          <c:if test="${dto.count ne 0 }">
          <div class="card">
            <a href="lectureInfo.do?lectureNum=${dto.lectureNum }">
            <c:set var = "file" value="${fn:split(dto.filename,',')}"/>
            <c:forEach var="ffile" items="${file}" varStatus="f">
            <c:if test="${f.count == 1}">
              <img id="sumimg" src="${pageContext.request.contextPath}\resources\ckUpload/lecture/${ffile}">
            </c:if>
            </c:forEach>
            </a>
            <div class="post-entry-1-contents">
              <h4><a href="lectureInfo.do?lectureNum=${dto.lectureNum }">${dto.subject}</a></h4>
              <div class="priceForm">
                <span class="price">&#8361;<fmt:formatNumber value="${dto.price}" pattern="#,###" /></span>
              </div>            
              <div class="boxprofile">
                <div class="box">
                  <img class="profile" src="${pageContext.request.contextPath}\resources\ckUpload/${dto.filename_face}">
                </div>
                <div class="profilename">
                  <font>${dto.name}</font>
                </div>
                <div class="profilename">
                  <font>${dto.date1}</font>
                </div>
              </div>            
              <p>
                <c:if test="${dto.count ne 0 }">
                  <div id="star" style="display: inline-block">
                    <ion-icon name="star-outline" style="vertical-align: -1px;"></ion-icon> ${dto.avg} <font id="starspan">[${dto.count}]</font>
                  </div> |
                </c:if>
                <c:if test="${dto.count eq 0 }">
                  <span>NEW</span> | 
                </c:if>
                  <font id="locfont">${dto.location1}&nbsp;${dto.location2}</font>
              </p>
            </div>
          </div>
          </c:if>
          </c:forEach>

        </div>
        
        <div id="divblock"></div>
        
        <div class="section-title">
          <h2>NEW</h2>
          <p>이번주 시작은 새로운 튜터와의 만남</p>
        </div>

        <div class="row" id="row">
            
          <c:forEach var="dto" items="${lectutrev}">
          <div class="card">
            <a href="lectureInfo.do?lectureNum=${dto.lectureNum }">
            <c:set var = "file" value="${fn:split(dto.filename,',')}"/>
            <c:forEach var="ffile" items="${file}" varStatus="f">
            <c:if test="${f.count == 1}">
              <img id="sumimg" src="${pageContext.request.contextPath}\resources\ckUpload\lecture/${ffile}">
            </c:if>
            </c:forEach>
            </a>
            <div class="post-entry-1-contents">
              <h4><a href="lectureInfo.do?lectureNum=${dto.lectureNum }">${dto.subject}</a></h4>
              <div class="priceForm">
                <span class="price">&#8361;<fmt:formatNumber value="${dto.price}" pattern="#,###" /></span>
              </div>            
              <div class="boxprofile">
                <div class="box">
                  <img class="profile" src="${pageContext.request.contextPath}\resources\ckUpload/${dto.filename_face}">
                </div>
                <div class="profilename">
                  <font>${dto.name}</font>
                </div>
                <div class="profilename">
                  <font>${dto.date1}</font>
                </div>
              </div>            
              <p>
                <c:if test="${dto.count ne 0 }">
                  <div id="star" style="display: inline-block">
                    <ion-icon name="star-outline" style="vertical-align: -1px;"></ion-icon> ${dto.avg} <font id="starspan">[${dto.count}]</font>
                  </div> |
                </c:if>
                <c:if test="${dto.count eq 0 }">
                  <span>NEW</span> | 
                </c:if>
                  <font id="locfont">${dto.location1}&nbsp;${dto.location2}</font>
              </p>
            </div>
          </div>
          </c:forEach>

        </div>
        
        <div id="divblock"></div>
        
        <div class="section-title">
          <h2>만원 이하 클래스</h2>
          <p>만원 이하의 클래스! 알차게 배워보자!</p>
        </div>

        <div class="row" id="row">
            
          <c:forEach var="dto" items="${rowPrice}">
          <div class="card">
            <a href="lectureInfo.do?lectureNum=${dto.lectureNum }">
            <c:set var = "file" value="${fn:split(dto.filename,',')}"/>
            <c:forEach var="ffile" items="${file}" varStatus="f">
            <c:if test="${f.count == 1}">
              <img id="sumimg" src="${pageContext.request.contextPath}\resources\ckUpload/lecture/${ffile}">
            </c:if>
            </c:forEach>
            </a>
            <div class="post-entry-1-contents">
              <h4><a href="lectureInfo.do?lectureNum=${dto.lectureNum }">${dto.subject}</a></h4>
              <div class="priceForm">
                <span class="price">&#8361;<fmt:formatNumber value="${dto.price}" pattern="#,###" /></span>
              </div>            
              <div class="boxprofile">
                <div class="box">
                  <img class="profile" src="${pageContext.request.contextPath}\resources\ckUpload/${dto.filename_face}">
                </div>
                <div class="profilename">
                  <font>${dto.name}</font>
                </div>
                <div class="profilename">
                  <font>${dto.date1}</font>
                </div>
              </div>            
              <p>
                <c:if test="${dto.count ne 0 }">
                  <div id="star" style="display: inline-block">
                    <ion-icon name="star-outline" style="vertical-align: -1px;"></ion-icon> ${dto.avg} <font id="starspan">[${dto.count}]</font>
                  </div> |
                </c:if>
                <c:if test="${dto.count eq 0 }">
                  <span>NEW</span> | 
                </c:if>
                  <font id="locfont">${dto.location1}&nbsp;${dto.location2}</font>
              </p>
            </div>
          </div>
          </c:forEach>

        </div>

      </div>
    </section><!-- End Why Us Section -->

  </main><!-- End #main -->

<%@ include file="bottom.jsp"%>