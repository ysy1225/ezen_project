<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

  <!-- Favicons -->
  <link href="${pageContext.request.contextPath}/resources/main/img/favicon.png" rel="icon">
  <link href="${pageContext.request.contextPath}/resources/main/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- 메인 Vendor CSS Files -->
  <link href="${pageContext.request.contextPath}/resources/main/mainvendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/main/mainvendor/bootstrap/css/bootstrap-grid2.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/main/mainvendor/icofont/icofont.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/main/mainvendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/main/mainvendor/animate.css/animate.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/main/mainvendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/main/mainvendor/venobox/venobox.css" rel="stylesheet">

  <!-- 메인 CSS File -->
  <link href="${pageContext.request.contextPath}/resources/main/style.css?after" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/main/profile.css?after" rel="stylesheet">
  <script src="//cdn.ckeditor.com/4.15.0/standard/ckeditor.js"></script>

  <main id="main">
  
    <section id="team" class="team section-bg" style="padding: 49px 0;">
      <div class="container">

        <div class="section-title" style="padding-bottom: 10px;">
          <h2 style="margin-top: 20px; margin-bottom: 10px;">거절 사유</h2>
        </div>
<form action="not.do" method="post">
<input type="hidden" name="tutorNum" value="${getTutor.tutorNum }">
        <div class="info" align="center">
          <div class="info3">
            <div class="rejectTextbox">
            <textarea class="subjectBox" name="tutorContent" id="content" type="text" placeholder="내용을 입력해 주세요.">
            ${getTutor.tutorContent }
            
            
            답변: 
            </textarea>
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
	        <div class="tutorButton">
	          <a href="#" onClick="history.back()">이전으로</a>
              <%-- <a href="not.do?tutorNum=${getTutor.tutorNum}" onclick="opener.parent.location.reload();window.close();">보내기</a> --%>
             <!--  <a href="#" onclick="document.getElementById('f').submit();">거절</a> -->
             <input type="submit">
            </div>
          </div>
        </div>
        </form>
        <script src="https://unpkg.com/ionicons@5.1.2/dist/ionicons.js"></script>
        <script>
          function goAction() {
        	  opener.location.href='tutorList.do?tutorNum=${getTutor.tutorNum}';
        	  self.close();
          }
        </script>

      </div>
    </section>
  
  </main>