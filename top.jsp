<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html style="font-size: 16px;">

<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta charset="utf-8">
  <meta name="keywords" content="Coaching Services, Fun Education, Supporting Your Success, Change Your Strategy">
  <meta name="description" content="">
  <meta name="page_type" content="np-template-header-footer-from-plugin">
  <title>Page 1</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nicepage.css" media="screen">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/Page-1.css" media="screen">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/logo-style.css" media="screen">
  <script class="u-script" type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.js" defer=""></script>
  <script class="u-script" type="text/javascript" src="${pageContext.request.contextPath}/resources/js/nicepage.js" defer=""></script>
  <meta name="generator" content="Nicepage 2.22.0, nicepage.com">
  <link id="u-theme-google-font" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i|Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i">
  <link id="u-page-google-font" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Oswald:200,300,400,500,600,700">
  <script type="application/ld+json">{
	"@context": "http://schema.org",
	"@type": "Organization",
	"name": "",
	"url": "index.html",
	"logo": "images/default-logo.png"
  }</script>
  <meta property="og:title" content="Page 1">
  <meta property="og:type" content="website">
  <meta name="theme-color" content="#478ac9">
  <link rel="canonical" href="index.html">
  <meta property="og:url" content="index.html">
</head>

<body data-home-page="Page-1.html" data-home-page-title="Page 1" class="u-body">
  <header class="u-clearfix u-header u-header" id="sec-c576">
    <div class="u-clearfix u-sheet u-sheet-1">
      <a href="mainForm.do" class="u-image u-logo u-image-1" data-image-width="80" data-image-height="40">
        <img src="${pageContext.request.contextPath}/resources/img/projectlogo.png" class="u-logo-image u-logo-image-1" data-image-width="64">
      </a>
      <nav class="u-menu u-menu-dropdown u-offcanvas u-menu-1">
        <div class="menu-collapse" style="font-size: 1rem; letter-spacing: 0;">
          <a class="u-button-style u-custom-left-right-menu-spacing u-custom-padding-bottom u-custom-top-bottom-menu-spacing u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" href="#">
            <svg><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#menu-hamburger"></use></svg>
            <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
              <defs>
                <symbol id="menu-hamburger" viewBox="0 0 16 16" style="width: 16px; height: 16px;">
                  <rect y="1" width="16" height="2"></rect>
                  <rect y="7" width="16" height="2"></rect>
                  <rect y="13" width="16" height="2"></rect>
                </symbol>
              </defs>
            </svg>
          </a>
        </div>
        <div class="u-custom-menu u-nav-container">
          <ul class="u-nav u-unstyled u-nav-1">
            <li class="u-nav-item">
              <a class="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" href="#" style="padding: 10px 20px;">생산자 등록</a>
            </li>
            <c:choose>
			<c:when test="${empty checkLogin}">
            <li class="u-nav-item">
              <a class="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" href="loginForm.do" style="padding: 10px 20px;">로그인</a>
            </li>                                                                   
            <li class="u-nav-item">
              <a class="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" href="joinUsers.do" style="padding: 10px 20px;">회원가입</a>
            </li>
            </c:when>
            <c:otherwise>
            <li class="u-nav-item">
              <a class="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" href="logout.do" style="padding: 10px 20px;">로그아웃</a>
            </li>
            </c:otherwise>
            </c:choose>
          </ul>
        </div>
        <div class="u-custom-menu u-nav-container-collapse">
          <div class="u-black u-container-style u-inner-container-layout u-opacity u-opacity-95 u-sidenav">
            <div class="u-menu-close"></div>
              <ul class="u-align-center u-nav u-popupmenu-items u-unstyled u-nav-2">
                <li class="u-nav-item">
                  <a class="u-button-style u-nav-link" href="Page-1.html">Page 1</a>
                </li>
                <li class="u-nav-item">
                  <a class="u-button-style u-nav-link" href="Page-2.html">Page 2</a>
                </li>
              </ul>
            </div>
            <div class="u-black u-menu-overlay u-opacity u-opacity-70"></div>
        </div>
      </nav>
      <nav class="u-align-left u-font-size-14 u-menu u-menu-dropdown u-nav-spacing-25 u-offcanvas u-menu-2" data-responsive-from="XL">
        <div class="menu-collapse">
          <a class="u-button-style u-nav-link" href="#" style="padding: 4px 0; font-size: calc(1em + 8px);">
            <svg class="u-svg-link" preserveAspectRatio="xMidYMin slice" viewBox="0 0 302 302" style=""><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#svg-7b92"></use></svg>
            <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" id="svg-7b92" x="0px" y="0px" viewBox="0 0 302 302" style="enable-background:new 0 0 302 302;" xml:space="preserve" class="u-svg-content">
              <g>
                <rect y="36" width="302" height="30"></rect>
                <rect y="236" width="302" height="30"></rect>
                <rect y="136" width="302" height="30"></rect>
              </g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g>
            </svg>
          </a>
        </div>
        <div class="u-custom-menu u-nav-container">
          <ul class="u-nav u-unstyled u-nav-3">
            <li class="u-nav-item">
              <a class="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" href="Page-1.html" style="padding: 10px 20px;">Page 1</a>
            </li>
            <li class="u-nav-item">
              <a class="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" href="Page-2.html" style="padding: 10px 20px;">Page 2</a>
            </li>
          </ul>
        </div>
        <div class="u-custom-menu u-nav-container-collapse">
          <div class="u-align-center u-black u-container-style u-inner-container-layout u-opacity u-opacity-95 u-sidenav">
            <div class="u-menu-close"></div>
              <ul class="u-align-center u-nav u-popupmenu-items u-unstyled u-nav-4">
                <li class="u-nav-item">
                  <a class="u-button-style u-nav-link" href="Page-1.html">인기수업</a>
                </li>
                <li class="u-nav-item">
                  <a class="u-button-style u-nav-link" href="Page-2.html">IT</a>
                </li>
                <li class="u-nav-item">
                  <a class="u-button-style u-nav-link" href="Page-3.html">디자인</a>
                </li>
                <li class="u-nav-item">
                  <a class="u-button-style u-nav-link" href="Page-4.html">실무역량</a>
                </li>
                <li class="u-nav-item">
                  <a class="u-button-style u-nav-link" href="Page-5.html">뷰티</a>
                </li>
                <li class="u-nav-item">
                  <a class="u-button-style u-nav-link" href="Page-6.html">외국어</a>
                </li>
                <li class="u-nav-item">
                  <a class="u-button-style u-nav-link" href="Page-7.html">음악</a>
                </li>
                <li class="u-nav-item">
                  <a class="u-button-style u-nav-link" href="Page-8.html">라이프스타일</a>
                </li>
                <li class="u-nav-item">
                  <a class="u-button-style u-nav-link" href="Page-9.html">기타</a>
                </li>
              </ul>
          </div>
          <div class="u-black u-menu-overlay u-opacity u-opacity-70"></div>
        </div>
      </nav>
    </div>
  </header>