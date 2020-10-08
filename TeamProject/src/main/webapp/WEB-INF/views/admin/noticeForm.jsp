<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
	      
	      <form action="insert_notice.do" name="f" method="post" onsubmit="return checkForm();">
	      <div style="width: 900px; overflow: hidden; margin-left: 85px; display: grid;">
	        <div class="comment-form">
	          <h4>공지사항 작성</h4>
	        </div>
	        <hr style="margin: 40px 0 40px 0;">
	        <div class="group">
	          <input class="subjectBox" name="subject" id="website" type="text" placeholder="제목">         
	        </div>
	        <div class="group">
	          <input class="subjectBox" name="writer" id="website" type="text" value="${getN}" readOnly>         
	        </div>
	        <div class="group">
	          <textarea class="subjectBox" name="content" id="content" type="text" placeholder="내용을 입력해 주세요."></textarea>
	          <script type="text/javascript">
	            CKEDITOR.replace('content', {
	            	filebrowserUploadUrl: 'imageUpload.do',
	            	height: 400
	            });
	            function checkForm() {
	            	if(f.subject.value == "") {
	            		alert("제목을 입력해 주세요.");
	            		f.subject.focus();
	            		return false;
	            	}
	            	if(f.writer.value == "") {
	            		alert("작성자를 입력해 주세요.");
	            		f.writer.focus();
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