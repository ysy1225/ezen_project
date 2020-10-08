<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="/WEB-INF/views/main/top.jsp"%>

  <link href="${pageContext.request.contextPath}/resources/sub/lecture2.css?after" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/sub/comstyle.css?after" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/chat.css?after" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/main/mainvendor/bootstrap/css/bootstrap-grid3.css" rel="stylesheet">

  <div class="container">
    <div class="wrap">
    
      <div class="submenu">
        
        <div class="col-lg-4 col-md-6 category">
          <div class="icon-box">
            <div class="icon"><ion-icon name="people-outline" style="font-size: 20px;"></ion-icon></div>
            <h5 class="title"><a href="community.do?comCate=all"><span class="underline--magical">전체</span></a></h5>
          </div>
        </div>
        <div class="col-lg-4 col-md-6 category">
          <div class="icon-box">
            <div class="icon"><ion-icon name="bug-outline" style="font-size: 20px;"></ion-icon></div>
            <h5 class="title"><a href="community.do?comCate=IT"><span class="underline--magical">IT</span></a></h5>
          </div>
        </div>
        <div class="col-lg-4 col-md-6 category">
          <div class="icon-box">
            <div class="icon"><ion-icon name="laptop-outline" style="font-size: 20px;"></ion-icon></div>
            <h5 class="title"><a href="community.do?comCate=디자인"><span class="underline--magical">디자인</span></a></h5>
          </div>
        </div>
        <div class="col-lg-4 col-md-6 category">
          <div class="icon-box">
            <div class="icon"><ion-icon name="flask-outline" style="font-size: 20px;"></ion-icon></div>
            <h5 class="title"><a href="community.do?comCate=뷰티"><span class="underline--magical">뷰티</span></a></h5>
          </div>
        </div>
        <div class="col-lg-4 col-md-6 category">
          <div class="icon-box">
            <div class="icon"><ion-icon name="musical-notes-outline" style="font-size: 20px;"></ion-icon></div>
            <h5 class="title"><a href="community.do?comCate=음악"><span class="underline--magical">음악</span></a></h5>
          </div>
        </div>
        <div class="col-lg-4 col-md-6 category">
          <div class="icon-box">
            <div class="icon"><ion-icon name="book-outline" style="font-size: 20px;"></ion-icon></div>
            <h5 class="title"><a href="community.do?comCate=실무역량"><span class="underline--magical">실무역량</span></a></h5>
          </div>
        </div>
        <div class="col-lg-4 col-md-6 category">
          <div class="icon-box">
            <div class="icon"><ion-icon name="language-outline" style="font-size: 20px;"></ion-icon></div>
            <h5 class="title"><a href="community.do?comCate=외국어"><span class="underline--magical">외국어</span></a></h5>
          </div>
        </div>
        <div class="col-lg-4 col-md-6 category">
          <div class="icon-box">
            <div class="icon"><ion-icon name="bicycle-outline" style="font-size: 20px;"></ion-icon></div>
            <h5 class="title"><a href="community.do?comCate=라이프스타일"><span class="underline--magical">라이프스타일</span></a></h5>
          </div>
        </div>
        <div class="col-lg-4 col-md-6 category">
          <div class="icon-box">
            <div class="icon"><ion-icon name="apps-outline" style="font-size: 20px;"></ion-icon></div>
            <h5 class="title"><a href="community.do?comCate=기타"><span class="underline--magical">기타</span></a></h5>
          </div>
        </div>
          
      </div>
      <a href="chat.do">aa</a>
      <div style="margin: 0 auto;">
      <div class="comsearch">
      <font class="searchfont">총 커뮤니티 <span class="searchfontspan">${count }</span></font>
      <form action="community.do" method="post">
        <input type="hidden" value="${comCate }" name="comCate">
        <select name="option" class="selsear">
          <option value="all">전체</option>
          <option value="comContent">내용</option>
          <option value="comSubject">제목</option>
          <option value="userName">작성자</option>
        </select>
        <input type="text" name="search" class="intext">
        <input type="submit" value="검색" class="btn1">
        <input type="button" value="글쓰기" class="btn1" onclick="writeCheckLogin();">
        <a href="myCom.do?userNum=${getUserNum }" class="btn2">내 글</a>
      </form>
      </div>
      </div>
      
      <div class="hopFrom">
      <div style="width: 750px;">
      <c:forEach var="dto" items="${list }">
      <div class="row" data-aos="fade">
        <div class="col-md-12">

          <div class="job-post-item bg-white p-4 d-block d-md-flex align-items-center">

            <div class="mb-4 mb-md-0 mr-5">
              <div class="job-post-item-header d-flex align-items-center">
                <h2 class="mr-3 text-black h4"><a href="communityContent.do?comNum=${dto.comNum }">${dto.comSubject }</a></h2>
                <div class="badge-wrap">
                  <span class="bg-warning text-white badge py-2 px-4">${dto.userName }</span>
                </div>
              </div>
              <div class="job-post-item-body d-block d-md-flex">
                <div class="mr-3"><span class="fl-bigmug-line-portfolio23">카테고리&nbsp;</span> <a href="#">${dto.comCate }</a></div>
                <div><span class="fl-bigmug-line-big104">등록일&nbsp;</span> <span>${dto.comDate }</span></div>
              </div>
            </div>

            <div class="ml-auto">
              <a href="#" class="btn btn-secondary rounded-circle btn-favorite text-gray-500"><ion-icon name="heart-circle-outline" style="margin-top: 8px; font-size: 20px;"></ion-icon></a><span style="margin-left: 10px; margin-right: 30px;">${dto.gCount }</span>
              <a href="#" class="btn btn-secondary rounded-circle btn-favorite text-gray-500"><ion-icon name="heart-dislike-circle-outline" style="margin-top: 8px; font-size: 20px;"></ion-icon></a><span style="margin-left: 10px;">${dto.bCount }</span>
            </div>
          </div>

        </div>
      </div>
      </c:forEach>
      
      <!-- 페이징 -->
      <div class="hoverPagination" id="roundBorder">
	    <c:if test="${page.curPage <= page.totPage}">
		  <a href="javascript:list('1')">«</a>
	    </c:if>
	    <c:if test="${page.curPage > 1}">
		  <a href="javascript:list('${page.prevPage}')">＜</a>
		</c:if>
		<c:forEach var="num" begin="${page.blockBegin}" end="${page.blockEnd}">
		  <c:choose>
		    <c:when test="${num == page.curPage}">
			  <span style="color: red;">${num}</span>
			</c:when>
			<c:otherwise>
			  <a href="javascript:list('${num}')">${num}</a>
			</c:otherwise>
	      </c:choose>
	    </c:forEach>
		<c:if test="${page.curPage ne page.totPage && page.totPage > 0}">
		  <a href="javascript:list('${page.nextPage}')">＞</a>
	    </c:if>
		<c:if test="${page.curPage <= page.totPage}">
		  <a href="javascript:list('${page.totPage}')">»</a>
		</c:if>
	  </div>
	  </div>
	  
	  <div align="center">
	    <div style="display: flex;">
        <div>
          <input type="text" id="sender" value="${getN }" style="display: none;">
          <input type="text" id="messageinput">
        </div>
        <div style="margin-left: 2px;">
          <button class="ntnbt" type="button" onclick="openSocket();">Open</button>
          <button class="ntnbt" type="button" onclick="send();">Send</button>
          <button class="ntnbt" type="button" onclick="closeSocket();">Close</button>
        </div>
        </div>
        <!-- Server responses get written here -->
        <div class="messageForm">
          <div id="messages" align="left"></div>
        </div>
      </div>
      </div>	  
	  
	  <script type="text/javascript">
	    function writeCheckLogin() {
	      var id = '${mbId}';
	    		
	      if (id == '') {
	        alert("로그인이 필요합니다.");
	    	location.href = 'loginForm.do';
	      } else {
	        location.href = 'writeCom.do';
	      }
	    }
	    function list(page) {
	      location.href="community.do?curPage="+page+"&option-${option}"+"&search=${search}";
	    }
	  </script>
	  
	  <script type="text/javascript">
        var ws;
        var messages=document.getElementById("messages");
        
        function openSocket(){
            if(ws!==undefined && ws.readyState!==WebSocket.CLOSED){
                writeResponse("WebSocket is already opened.");
                return;
            }
            //웹소켓 객체 만드는 코드
            ws=new WebSocket("ws://192.168.0.198:8080/matching/echo.do");
            
            ws.onopen=function(event){
                if(event.data===undefined) return;
                
                writeResponse(event.data);
            };
            ws.onmessage=function(event){
                writeResponse(event.data);
            };
            ws.onclose=function(event){
                writeResponse("Connection closed");
            }
        }
        
        function send(){
            var text=document.getElementById("messageinput").value+","+document.getElementById("sender").value;
            ws.send(text);
            text="";
        }
        
        function closeSocket(){
            ws.close();
        }
        function writeResponse(text){
            messages.innerHTML+="<br/>"+text;
        }
    </script>
      
    </div>
  </div>

<%@ include file="bottom.jsp"%>