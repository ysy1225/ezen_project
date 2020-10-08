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

  <main id="main">
  
    <section id="team" class="team section-bg" style="padding: 49px 0;">
      <div class="container">

        <div class="section-title" style="padding-bottom: 10px;">
          <div class="profile">
          <p><img src="${pageContext.request.contextPath}\resources\ckUpload/${getTutor.filename_face}"></p>
          </div>
          <h2 style="margin-top: 20px; margin-bottom: 10px;">${getTutor.tutorNickName}</h2>
        </div>

        <div class="info" align="center">
          <p style="margin-bottom: 12px;"><ion-icon name="call-outline"></ion-icon></p>
          <%-- <p>${getTutor.tutorPhone}</p>&nbsp;&nbsp;
          <p style="margin-bottom: 12px;"><ion-icon name="person-circle-outline"></ion-icon></p>
          <p>${getTutor.tutorEmail}</p> --%>
          <div class="info2">
            <div>
              <font id="nick">닉네임</font>
              <h5 style="margin-bottom: 30px;">${getTutor.tutorNickName}</h5>
            </div>
            <div>
              <font id="nick">분야</font>
              <h5 style="margin-bottom: 30px;">${getTutor.tutorMajor}</h5>
            </div>
          </div>
          <div class="wrap">
            <font id="nick">자기소개</font>
            <h6>${getTutor.tutorContent}</h6>
          </div>
          <div class="down">
            <font id="nick">이력서</font>
            <span class="css_button"><a href="${pageContext.request.contextPath}\resources\ckUpload/${getTutor.filename}">${getTutor.filename}</a></span>
          </div>
          <div class="tutorButton">
            <%-- <a href="userLevelUp.do?tutorNum=${getTutor.tutorNum}" onclick="opener.parent.location.reload(); window.close();">승인</a> --%>
            <c:if test="${level == '2' }">
            <a href="#" onclick="opener.parent.location='userLevelUp.do?tutorNum=${getTutor.tutorNum}';window.close();">승인</a>
            <a href="rejectForm.do?tutorNum=${getTutor.tutorNum }" onclick="window.open(this.href,'팝업창','width=600, height=600'); return false;">거절</a>
            </c:if>
            <c:if test="${level != '2' }">
            <a href="deleteTutor.do?tutorNum=${getTutor.tutorNum }">삭제</a>
            </c:if>
            <script type="text/javascript">
			    function popupOpen(){
			        url = "rejectForm.do?tutorNum=${getTutor.tutorNum }";
			        name = "팝업";
			        specs = "width=800,height=400,top=200,left=100,toolbar=no,menubar=no,scrollbars=no,resizable=yes";
			        window.open(url, name, specs);
			        return false;
			  	}
			</script>
          </div>
        </div>
        
        <script src="https://unpkg.com/ionicons@5.1.2/dist/ionicons.js"></script>

      </div>
    </section>
  
  </main>