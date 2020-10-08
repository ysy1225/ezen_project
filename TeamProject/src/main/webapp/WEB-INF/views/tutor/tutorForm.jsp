<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="/WEB-INF/views/main/top.jsp"%>

  <!-- 회원관리 테이블 CSS File -->
  <%-- <link href="${pageContext.request.contextPath}/resources/admin/member/images/icons/favicon.ico?after" rel="icon">
  <link href="${pageContext.request.contextPath}/resources/admin/member/main2.css?after" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/admin/member/util.css?after" rel="stylesheet"> --%>
  <link href="${pageContext.request.contextPath}/resources/sub/tutorinput.css?after" rel="stylesheet">
  <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
  <%-- <link href="${pageContext.request.contextPath}/resources/admin/member/search.css?after" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/admin/member/notice.css?after" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Rubik:wght@300;400;500&display=swap" rel="stylesheet"> --%>
  
  <div class="container">
    <div class="wrap">
      <h4>튜터 등록</h4>
      
      <hr>
      
      <form action="insert_tutor.do" name="f" method="post" enctype="multipart/form-data" onsubmit="return check()">
      <input type="hidden" name="userNum" value="${getUserNum}">
      <div class="contents">
        <div id="contents1">이름</div>
        <div id="contents2">
          <input type="text" class="forminput" name="tutorName" value="${getN}" readonly>
        </div>
      </div>
      <div class="contents">
        <div id="contents1">아이디</div>
        <div id="contents2">
          <input type="text" class="forminput" name="tutorEmail" value="${mbId}" readonly>
        </div>
      </div>
      <div class="contents">
        <div id="contents1">닉네임</div>
        <div id="contents2">
          <input type="text" class="forminput" name="tutorNickName">
        </div>
      </div>
      <div class="contents">
        <div id="contents1">프로필사진</div>
        <div class="avatar-upload">
          <div class="avatar-edit">
            <input type="file" id="imageUpload" name="filename_face" accept=".png, .jpg, .jpeg" />
            <label id="imageLabel" for="imageUpload"><ion-icon name="cloud-upload-outline"></ion-icon></label>
          </div>
          <div class="avatar-preview">
            <div id="imagePreview" style="background-image: url(${pageContext.request.contextPath}/resources/main/img/about.jpg);"></div>
          </div>
        </div>
      </div>      
      <div class="contents">
        <div id="contents1">전공</div>
        <div id="contents2">
          <select class="forminput" name="tutorMajor">
            <option value="IT">IT</option>
            <option value="design">디자인</option>
            <option value="ability">실무역량</option>
	        <option value="beauty">뷰티</option>
	        <option value="language">외국어</option>
	        <option value="music">음악</option>
	        <option value="lifeStyle">라이프스타일</option>
	        <option value="other">기타</option>
          </select>
        </div>
      </div>
      <div class="contents">
        <div id="contents1">자기소개</div>
        <div id="contents2">
          <textarea class="subjectBox" name="tutorContent" id="content" type="text" placeholder="내용을 입력해 주세요."></textarea>
	          <script type="text/javascript">
	            CKEDITOR.replace('content', {
	            	filebrowserUploadUrl: 'imageUpload.do',
	            	height: 400,
	            	width: 800
	            });
	          </script>
        </div>
      </div>
      <div class="contents">
        <div id="contents1">이력서</div>
        <div class="file-upload">
          <div class="file-select">
            <div class="file-select-button" id="fileName">Choose File</div>
            <div class="file-select-name" id="noFile">No file chosen...</div> 
            <input type="file" name="filename" id="chooseFile">
          </div>
        </div>
      </div>
      
      <hr style="margin: 2.33em 0;">
      
      <div class="panel">
      <input type="submit" value="등록하기" class="btn">
      <input type="reset" value="다시쓰기" class="btn">
      </div>
      </form>
      
    </div>
  </div>

  <%-- <main id="main">
  
    <div class="limiter">
      <div class="container-table100">      
	    <div class="wrap-table100">
	      
	      <form action="insert_tutor.do" name="f" method="post" onsubmit="return checkForm()" enctype="multipart/form-data">
	      <input type="hidden" name="userNum" value="${getUserNum}"/>
	      <div style="width: 900px; overflow: hidden; margin-left: 85px; display: grid;">
	        <div class="comment-form">
	          <h4>튜터 등록</h4>
	          <p>
	        </div>
	        <hr style="margin: 40px 0 40px 0;">
	        <div class="group">
	          <div>
	            <div class="grouplabel1" style="float: left; width: 10%;">이름</div>	          
	            <div style="float: left; width: 20%;">
	              <input class="subjectBox" name="tutorName" id="website" type="text" value="${getN}" style="display: inline;" readOnly>
	            </div>
	          </div>
	        </div>
	        <div class="group">
	          <div>
	            <div class="grouplabel1" style="float: left; width: 10%;">전화번호</div>	          
	            <div style="float: left; width: 20%;">
	              <input class="subjectBox" name="tutorPhone" id="website" type="text" value="${getP}" style="display: inline;" readOnly>
	            </div>
	          </div>
	        </div>
	        <div class="group">
	          <div>
	            <div class="grouplabel1" style="float: left; width: 10%;">이메일</div>	          
	            <div style="float: left; width: 20%;">
	              <input class="subjectBox" name="tutorEmail" id="website" type="text" value="${mbId}" style="display: inline;" readOnly>
	            </div>
	          </div>
	        </div>
	        <div class="group">
	          <div>
	            <div class="grouplabel1" style="float: left; width: 10%;">닉네임</div>	          
	            <div style="float: left; width: 20%;">
	              <input class="subjectBox" name="tutorNickName" id="website" type="text" placeholder="닉네임을 입력해 주세요." style="display: inline;">
	            </div>
	          </div>
	        </div>
	        <div class="group">
	          <div>
	            <div class="grouplabel1" style="float: left; width: 10%;">프로필사진</div>	          
	            <div style="float: left; width: 20%;">
	              <input type="file" name="filename_face" id="website" style="display: inline;" onchange="preview(event)">
	              <div id="one">
	                <img src="${pageContext.request.contextPath}/resources/ckUpload/boradolee.jpg" id="img">
	              </div>
	            </div>	            
	          </div>
	        </div>
	        <div class="group">
	          <div>
	            <div class="grouplabel1" style="float: left; width: 10%;">전공</div>
	            <div style="float: left; width: 20%;">
	              <select name="tutorMajor">
	                <option value="IT">IT</option>
	                <option value="design">디자인</option>
	                <option value="ability">실무역량</option>
	                <option value="beauty">뷰티</option>
	                <option value="language">외국어</option>
	                <option value="music">음악</option>
	                <option value="lifeStyle">라이프스타일</option>
	                <option value="other">기타</option>
	              </select>
	            </div>
	          </div>
	        </div>
	        <div class="group">
	          <label class="grouplabel2" style="margin: 0 0 10px 0;">자기소개</label>
	          <textarea class="subjectBox" name="tutorContent" id="content" type="text" placeholder="내용을 입력해 주세요."></textarea>
	          <script type="text/javascript">
	            CKEDITOR.replace('content', {
	            	filebrowserUploadUrl: 'imageUpload.do',
	            	height: 400
	            });
	            function checkForm() {
	            	if(f.tutorNickName.value == "") {
	            		alert("닉네임을 입력해 주세요.");
	            		f.tutorNickName.focus();
	            		return false;
	            	}
	            	if(f.filename_face.value == "") {
	            		alert("프로필사진을 입력해 주세요.");
	            		f.filename_face.focus();
	            		return false;
	            	}
	            	if(f.filename.value == "") {
	            		alert("이력서를 입력해 주세요.");
	            		f.filename_face.focus();
	            		return false;
	            	}
		            if(CKEDITOR.instances.content.getData() == '' || CKEDITOR.instances.content.getData() == 0) {
	            		alert("자기소개를 입력해 주세요.");
	            		$("#content").focus();
	            		return false;
	            	}
	            }
	          </script>
	        </div>
	        <div class="group">
	          <div>
	            <div class="grouplabel1" style="float: left; width: 10%;">이력서</div>	          
	            <div style="float: left; width: 20%;">
	              <input type="file" name="filename" id="website" style="display: inline;">
	            </div>
	          </div>
	        </div>
	        <hr style="margin: 0 0 40px 0;">
	        <div class="subjectListButton">
	          <input class="noticeButton" type="submit" id="btnWriter" value="저장하기">
	        </div>
	      </div>
	      </form>
		  
	    </div>
      </div>
    </div>
  
  </main> --%>

<%@ include file="/WEB-INF/views/main/bottom.jsp"%>