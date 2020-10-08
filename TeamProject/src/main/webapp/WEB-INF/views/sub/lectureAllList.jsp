<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@ include file="/WEB-INF/views/main/top.jsp"%>

  <link href="${pageContext.request.contextPath}/resources/sub/lecture.css?after" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/main/card.css?after" rel="stylesheet">
  
  <script>
    function addressKindChange(e) {
	  var seoul = ["선택","강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구",
		           "동작구","마포구","서대문구","서초구","성동구","성북구",
				   "송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
	  var busan = ["선택","강서구","금정구","남구","동구","동래구","부산진구","북구","사상구","사하구","서구","수영구","연제구","영도구",
				   "중구","해운대구"];
	  var target = document.getElementById("loc2");

	  if(e.value == "서울") var d = seoul;
	  else if(e.value == "부산") var d = busan;

	  target.options.length = 0;

	  for(x in d) {
		 var opt = document.createElement("option");
		 opt.value=d[x];
		 opt.innerHTML = d[x];
		 target.appendChild(opt);
	  }
    }
  </script>

  <div class="container">
    <div class="wrap">
    
      <div class="submenu">
        
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
    
      <form action="lectureAllList.do?mode=${mode}" method="post">
        <div id="searchForm">
          <div id="loc1">
	        <select id="loc1" name="loc1" onchange="addressKindChange(this)">
	          <option value="선택" selected disabled>지역을 선택하세요.</option>
		      <option value="서울">서울</option>
		      <option value="부산">부산</option>
	        </select>
	      </div>
		  <div class="grouplabel1" style="float: left; width: 3%;"></div>	          
	      <div class="locloc" style="float: left;">
	        <select id="loc2" name="loc2" >
	          <option>선택하세요.</option>
	        </select>
	      </div>
	      <div>
	        <input class="locbtn" type="submit" value="검색하기">
	      </div>
	    </div>
      </form>
            
      
      <div id="leccount">
        <div>${count}개의 수업</div>
      </div>
      
      <div class="row" id="row">
      <c:forEach var="dto" items="${lectureAllList}">
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
  </div>	

<%@ include file="/WEB-INF/views/main/bottom.jsp"%>