<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<html>

<head>
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>ezen project</title>
  <meta content="" name="descriptison">
  <meta content="" name="keywords">

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
  
  <script src="//cdn.ckeditor.com/4.15.0/standard/ckeditor.js"></script>
</head>

<body>

  <!-- ======= Top Bar ======= -->
  <div id="topbar" class="d-none d-lg-flex align-items-center fixed-top">
    <div class="container d-flex">
      <div class="contact-info mr-auto">
        <i class="icofont-envelope"></i> <a href="mailto:contact@example.com">contact@example.com</a>
        <i class="icofont-phone"></i> +82 10 1111 2222
      </div>
      <div class="social-links">
        <a href="#" class="twitter"><i class="icofont-twitter"></i></a>
        <a href="#" class="facebook"><i class="icofont-facebook"></i></a>
        <a href="#" class="instagram"><i class="icofont-instagram"></i></a>
        <a href="#" class="skype"><i class="icofont-skype"></i></a>
        <a href="#" class="linkedin"><i class="icofont-linkedin"></i></a>
      </div>
    </div>
  </div>

  <!-- ======= 메인메뉴 ======= -->
  <header id="header" class="fixed-top">
    <div class="container d-flex align-items-center">

      <!-- 로고 -->
      <h1 class="logo mr-auto"><a href="mainForm.do"><img src="${pageContext.request.contextPath}/resources/main/img/mainlogo.png"></a></h1>
      
      <!-- 로그인 안한 상태 -->
      <c:if test="${mbId eq null}">
      <nav class="nav-menu d-none d-lg-block">
        <ul>
          <li class="active"><a href="mainForm.do">홈</a></li>
          <li><a href="community.do">커뮤니티</a></li>
          <li><a href="listNotice.do">공지사항</a></li>
          <li><a href="tutorForm.do">튜터등록</a></li>
          <li><a href="loginForm.do">로그인</a></li>
        </ul>
      </nav>
      <a href="joinForm.do" class="get-started-btn scrollto">회원가입</a>
      </c:if>
      
      <!-- 일반회원이 로그인 한 상태 -->
      <c:if test="${level == '0'}">
      <c:if test="${mbId ne null}">
      <nav class="nav-menu d-none d-lg-block">
        <ul>
          <li class="active"><a href="mainForm.do">홈</a></li>
          <li><a href="community.do">커뮤니티</a></li>
          <li><a href="listNotice.do">공지사항</a></li>
          <li><a href="inquiryForm.do?userEmail=${mbId}">문의하기</a></li>
          <c:if test="${tutorLevel != '0' }">
          <li><a href="tutorForm.do">튜터등록</a></li>
          </c:if>
          <li class="drop-down"><a href="#">마이페이지</a>
            <ul>
              <li><a href="myPageCheck.do">내 프로필</a></li>
              <li><a href="inquiry.do?userEmail=${mbId}">내 문의</a></li>
              <li><a href="changePw.do?userNum=${userNum}">비밀번호 변경</a></li>
              <li><a href="myPageDelete.do">회원탈퇴</a></li>
            </ul>
          </li>
        </ul>        
      </nav>
        <a href="logout.do" class="get-started-btn scrollto">로그아웃</a>
        <font style="font-size: 12px; margin-left: 20px;"><span style="color: orange; font-weight: bold; padding: 0 3px 0 0;"><c:out value="${getN}"/></span>님 환영합니다.</font>
      </c:if>
      </c:if>
      
      <!-- 튜터 로그인 -->
      <c:if test="${level == '1'}">
      <nav class="nav-menu d-none d-lg-block">
        <ul>
          <li class="active"><a href="mainForm.do">홈</a></li>
          <li><a href="community.do">커뮤니티</a></li>
          <li><a href="lectureInput.do">강의등록</a></li>
          <li class="drop-down"><a href="">게시판</a>
            <ul>
              <li><a href="listNotice.do">공지사항</a></li>
              <li><a href="inquiryFAQ.do">FAQ</a></li>
            </ul>
          </li>
          <li class="drop-down"><a href="#">마이페이지</a>
            <ul>
              <li><a href="myPageCheck.do">내 프로필</a></li>
              <li><a href="lectureList.do">내 강의목록</a></li>
              <li><a href="inquiry.do?userEmail=${mbId}">내 문의</a></li>
              <li><a href="changePw.do?userNum=${userNum}">비밀번호 변경</a></li>
              <li><a href="myPageDelete.do">회원탈퇴</a></li>
            </ul>
          </li>
        </ul>
      </nav>
        <a href="logout.do" class="get-started-btn scrollto">로그아웃</a>
        <font style="font-size: 12px; margin-left: 20px;"><span style="color: orange; font-weight: bold; padding: 0 3px 0 0;"><c:out value="${getN}"/></span>님 환영합니다.</font>
      </c:if>
      
      <!-- 관리자 로그인 -->
      <c:if test="${level == '2'}">      
      <nav class="nav-menu d-none d-lg-block">
        <ul>
          <li class="active"><a href="mainForm.do">홈</a></li>
          <li><a href="community.do">커뮤니티</a></li>
          <li class="drop-down"><a href="memberList.do">회원관리</a>
            <ul>
              <li><a href="tutorList.do">튜터심사</a></li>
            </ul>
          </li>
          <li class="drop-down"><a href="">게시판</a>
            <ul>
              <li><a href="adminListNotice.do">공지사항</a></li>
              <li><a href="adminInquiry.do">1:1Q&amp;A</a></li>
              <li><a href="inquiryAdmin.do">FAQ</a></li>
            </ul>
          </li>
        </ul>
      </nav>
        <a href="logout.do" class="get-started-btn scrollto">로그아웃</a>
        <font style="font-size: 12px; margin-left: 20px;"><span style="color: orange; font-weight: bold; padding: 0 3px 0 0;"><c:out value="${getN}"/></span>관리자</font>
      </c:if>

    </div>
    <!--Start of Tawk.to Script-->
<script type="text/javascript">
var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();
Tawk_API.visitor = {
	    name  : '${getN}',
	    email : '${mbId}'
	};
(function(){
var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];
s1.async=true;
s1.src='https://embed.tawk.to/5f64715ff0e7167d00117eac/default';
s1.charset='UTF-8';
s1.setAttribute('crossorigin','*');
s0.parentNode.insertBefore(s1,s0);
})();
</script>
<!--End of Tawk.to Script-->
  </header>