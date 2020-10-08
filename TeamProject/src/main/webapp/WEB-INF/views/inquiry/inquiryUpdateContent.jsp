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
	      
	      <c:if test="${level != '2'}">
	      <form action="updateContent.do" name="f" method="post" onsubmit="return checkForm();" enctype="multipart/form-data">
	      <div style="width: 900px; overflow: hidden; margin-left: 85px; display: grid;">
	        <div class="comment-form">
	          <h4>문의 작성<sub><b style="color: #525252;">오전 시간</b>에는 전날 영업일 이후의 문의부터 <b style="color: #525252;">순차적</b>으로 답변드리고 있어 다시 시간이 소요될 수 있는 점 양해부탁드립니다.</sub></h4>
	          <p>
	        </div>
	        <hr style="margin: 40px 0 40px 0;">
	        <div class="group">
	          <label class="grouplabel1">이름</label>
	          <input class="subjectBox" name="inqName" id="website" type="text" placeholder="작성자" value="${getInq.inqName}" style="display: inline;" readOnly>
	        </div>
	        <div class="group">
	          <label class="grouplabel2">전화번호</label>
	          <input class="subjectBox" name="inqPhone" id="website" type="text" placeholder="휴대전화" value="${getInq.inqPhone}" style="display: inline;" readOnly>
	        </div>
	        <div class="group">
	          <label class="grouplabel3">이메일</label>
	          <input class="subjectBox" name="userEmail" id="website" type="text" placeholder="이메일" value="${getInq.userEmail}" style="display: inline;" readOnly>
	        </div>
	        <div class="group">
	          <label class="grouplabel1">제목</label>
	          <input class="subjectBox" name="inqSubject" id="website" type="text" placeholder="제목을 입력해 주세요." value="${getInq.inqSubject}" style="display: inline;">
	        </div>
	        <div class="group">
	          <textarea class="subjectBox" name="inqContent" id="content" type="text" placeholder="내용을 입력해 주세요.">${getInq.inqContent}</textarea>
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
	            	if(f.userEmail.value == "") {
	            		alert("이메일을 입력해 주세요.");
	            		f.userEmail.focus();
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
	          <input type="file" name="filename" value="${getInq.filename}">
	        </div>
	        <hr style="margin: 0 0 40px 0;">
	        <div class="subjectListButton">
	          <input class="noticeButton" type="submit" id="btnWriter" value="수정하기">
	          <input class="noticeButton" type="reset" id="btnReset" value="다시작성">
	        </div>
	      </div>
	      </form>
	      </c:if>
	      
	      <c:if test="${level == '2'}">
	      <form action="updateInq.do?inqNum=${getInq.inqNum}" name="f" method="post" onsubmit="return checkForm();" enctype="multipart/form-data">
	      <div style="width: 900px; overflow: hidden; margin-left: 85px; display: grid;">
	        <div class="comment-form">
	          <h4>문의 작성<sub><b style="color: #525252;">오전 시간</b>에는 전날 영업일 이후의 문의부터 <b style="color: #525252;">순차적</b>으로 답변드리고 있어 다시 시간이 소요될 수 있는 점 양해부탁드립니다.</sub></h4>
	          <p>
	        </div>
	        <hr style="margin: 40px 0 40px 0;">
	        <div class="group">
	          <label class="grouplabel1">이름</label>
	          <input class="subjectBox" name="inqName" id="website" type="text" placeholder="작성자" value="${getInq.inqName}" style="display: inline;" readOnly>
	        </div>
	        <div class="group">
	          <label class="grouplabel2">전화번호</label>
	          <input class="subjectBox" name="inqPhone" id="website" type="text" placeholder="휴대전화" value="${getInq.inqPhone}" style="display: inline;" readOnly>
	        </div>
	        <div class="group">
	          <label class="grouplabel3">이메일</label>
	          <input class="subjectBox" name="userEmail" id="website" type="text" placeholder="이메일" value="${getInq.userEmail}" style="display: inline;" readOnly>
	        </div>
	        <div class="group">
	          <label class="grouplabel1">제목</label>
	          <input class="subjectBox" name="inqSubject" id="website" type="text" placeholder="제목을 입력해 주세요." value="${getInq.inqSubject}" style="display: inline;">
	        </div>
	        <div class="group">
	          <c:choose>
              <c:when test="${getInq.inqOk == 0}">
	          <textarea class="subjectBox" name="inqContent" id="content" type="text" placeholder="내용을 입력해 주세요.">${getInq.inqContent}
	          <br>
	          <br>
	          <br>
	                        답변 : &nbsp;
	          </textarea>
	          </c:when>
	          <c:otherwise>
	          <textarea class="subjectBox" name="inqContent" id="content" type="text" placeholder="내용을 입력해 주세요.">${getInq.inqContent}</textarea>
	          </c:otherwise>
	          </c:choose>
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
	            	if(f.userEmail.value == "") {
	            		alert("이메일을 입력해 주세요.");
	            		f.userEmail.focus();
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
	                      파일 : ${getInq.filename}
	        </div>
	        <hr style="margin: 0 0 40px 0;">
	        <div class="subjectListButton">
	          <input class="noticeButton" type="submit" id="btnWriter" value="답변">
	        </div>
	      </div>
	      </form>
	      </c:if>
		  
	    </div>
      </div>
    </div>
  
  </main>

<%@ include file="/WEB-INF/views/main/bottom.jsp"%>