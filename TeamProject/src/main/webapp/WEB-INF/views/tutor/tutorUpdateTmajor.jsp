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
           
        <form name="f" action="updateTutor.do?tutorNum=${param.tutorNum}" method="post">
        <div class="info" align="center">
          <div class="info2">
            <div>
              <font id="nick">전공</font>
              <select name="tutorMajor">
                <option value="IT">IT</option>
                <option value="디자인">디자인</option>
                <option value="실무역량">실무역량</option>
                <option value="뷰티">뷰티</option>
                <option value="외국어">외국어</option>
                <option value="음악">음악</option>
                <option value="라이프스타일">라이프스타일</option>
                <option value="기타">기타</option>
              </select>
            </div>
          </div>
          <div class="tutorButton">
            <%-- <a href="userLevelUp.do?tutorNum=${getTutor.tutorNum}" onclick="opener.parent.location.reload(); window.close();">승인</a> --%>
            <input type="submit" onclick="goSubmit()" value="저장">
            <script type="text/javascript">
            	function goSubmit() {
            		window.opener.name = "팝업";
            		document.f.target = "팝업";
            		document.f.action = "updateTutor.do?tutorNum=${param.tutorNum}";
            		document.f.submit();
            		self.close();
            	}
            </script>
          </div>
        </div>
        </form>
        
        <script src="https://unpkg.com/ionicons@5.1.2/dist/ionicons.js"></script>

      </div>
    </section>
  
  </main>