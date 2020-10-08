<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="/WEB-INF/views/main/top.jsp"%>

  <!-- 회원관리 테이블 CSS File -->
  <link href="${pageContext.request.contextPath}/resources/admin/member/images/icons/favicon.ico?after" rel="icon">
  <link href="${pageContext.request.contextPath}/resources/admin/member/main2.css?after" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/admin/member/util.css?after" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/admin/member/search.css?after" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/admin/member/notice.css?after" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Rubik:wght@300;400;500&display=swap" rel="stylesheet">

  <main id="main">
  
    <div class="limiter">
      <div class="container-table100">      
	    <div class="wrap-table100">
	      
	      <div style="display: grid; grid-template-columns: 33% 33% 34%; padding: 0 0 50px 0; text-align: center;">
	        <div style="border-right: 1px solid #eee;">
	          <font style="font-size: 19px; font-family: 'Rubik', sans-serif;">Tel.1544-1515</font><br>
	          <font style="font-size: 12px; color: #a7a7a7;">평일 9:00~18:00(점심 12:00~13:00)</font>
	        </div>
	        <div style="border-right: 1px solid #eee;">
	          <a href="#" onclick="checkLogin()" style="color: black;"><font style="font-size: 19px; font-family: 'Rubik', sans-serif;">1:1 Q&amp;A</font></a><br>
	          <font style="font-size: 12px; color: #a7a7a7;">질문 전 FAQ(자주 묻는 질문)을 먼저 확인해 주세요.</font>
	        </div>
	        <div>
	          <font style="font-size: 19px; font-family: 'Rubik', sans-serif;">FAQ</font><br>
	          <font style="font-size: 12px; color: #a7a7a7;">자주 묻는 질문</font>
	        </div>
	      </div>
	      
	      <div class="section-title">
            <h2></h2>
            <p></p>
          </div>
	      
	      <form action="insertInq.do" name="f" method="post" onsubmit="return checkForm();" enctype="multipart/form-data">
	      <div style="width: 900px; overflow: hidden; margin-left: 85px; display: grid;">
	        <div class="comment-form">
	          <h4>문의 작성<sub><b style="color: #525252;">오전 시간</b>에는 전날 영업일 이후의 문의부터 <b style="color: #525252;">순차적</b>으로 답변드리고 있어 다시 시간이 소요될 수 있는 점 양해부탁드립니다.</sub></h4>
	          <p>
	        </div>
	        <hr style="margin: 40px 0 40px 0;">
	        <div class="group">
	          <label class="grouplabel1">이름</label>
	          <input class="subjectBox" name="inqName" id="website" type="text" placeholder="작성자" value="${getN}" style="display: inline;">
	        </div>
	        <div class="group">
	          <label class="grouplabel2">전화번호</label>
	          <input class="subjectBox" name="inqPhone" id="website" type="text" placeholder="휴대전화" value="${getP}" style="display: inline;">
	        </div>
	        <div class="group">
	          <label class="grouplabel3">이메일</label>
	          <input class="subjectBox" name="userEmail" id="website" type="text" placeholder="이메일" value="${mbId}" style="display: inline;">
	        </div>
	        <div class="group">
	          <label class="grouplabel1">제목</label>
	          <input class="subjectBox" name="inqSubject" id="website" type="text" placeholder="제목을 입력해 주세요." style="display: inline;">
	        </div>
	        <div class="group">
	          <textarea class="subjectBox" name="inqContent" id="content" type="text" placeholder="내용을 입력해 주세요."></textarea>
	          <script type="text/javascript">
	            CKEDITOR.replace('content', {
	            	filebrowserUploadUrl: 'imageUpload.do',
	            	height: 400
	            });
	            function checkForm() {
	            	if(f.inqSubject.value == "") {
	            		alert("제목을 입력해 주세요.");
	            		f.inqSubject.focus();
	            		return false;
	            	}
	            	if(f.inqName.value == "") {
	            		alert("작성자를 입력해 주세요.");
	            		f.inqName.focus();
	            		return false;
	            	}
	            	if(f.inqPhone.value == "") {
	            		alert("전화번호를 입력해 주세요.");
	            		f.inqPhone.focus();
	            		return false;
	            	}
	            	if(f.inqEmail.value == "") {
	            		alert("이메일을 입력해 주세요.");
	            		f.inqEmail.focus();
	            		return false;
	            	}
		            if(CKEDITOR.instances.content.getData() == '' || CKEDITOR.instances.content.getData() == 0) {
	            		alert("내용을 입력해 주세요.");
	            		$("#content").focus();
	            		return false;
	            	}
	            }
	          </script>
	        </div>
	        <div class="group">
	          <input type="file" name="filename">
	        </div>
	        <hr style="margin: 0 0 40px 0;">
	        <div class="subjectListButton">
	          <input class="noticeButton" type="submit" id="btnWriter" value="작성하기">
	          <input class="noticeButton" type="reset" id="btnReset" value="다시작성">
	        </div>
	      </div>
	      </form>
		  
	    </div>
      </div>
    </div>
  
  </main>

<%@ include file="bottom.jsp"%>