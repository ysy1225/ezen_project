<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="top.jsp"%>

  <!-- ======= 배너 ======= -->
  <section id="hero">
    <div id="heroCarousel" class="carousel slide carousel-fade" data-ride="carousel">

      <ol class="carousel-indicators" id="hero-carousel-indicators"></ol>

      <div class="carousel-inner" role="listbox">

        <!-- Slide 1 -->
        <div class="carousel-item active" style="background-image: url(${pageContext.request.contextPath}/resources/main/img/slide/slide1.jpg)">
          <div class="carousel-container">
            <div class="container">
              <h2 class="animate__animated animate__fadeInDown">나만 알고 싶은 일러스트 작가</h2>
              <p class="animate__animated animate__fadeInUp">다양한 아티스트와의 만남으로<br> 기초부터 노하우까지 알아보자</p>
              <a href="#about" class="btn-get-started animate__animated animate__fadeInUp scrollto">보러가기</a>
            </div>
          </div>
        </div>

        <!-- Slide 2 -->
        <div class="carousel-item" style="background-image: url(${pageContext.request.contextPath}/resources/main/img/slide/slide2.jpg)">
          <div class="carousel-container">
            <div class="container">
              <h2 class="animate__animated animate__fadeInDown">3D 디자이너가 되기 위한</h2>
              <p class="animate__animated animate__fadeInUp">초보자도 빠르게 배울 수 있는 커리큘럼<br> 수업 자료 제공과 함께 꿀팁 제공</p>
              <a href="#about" class="btn-get-started animate__animated animate__fadeInUp scrollto">보러가기</a>
            </div>
          </div>
        </div>

        <!-- Slide 3 -->
        <div class="carousel-item" style="background-image: url(${pageContext.request.contextPath}/resources/main/img/slide/slide3.jpg)">
          <div class="carousel-container">
            <div class="container">
              <h2 class="animate__animated animate__fadeInDown">나도 이젠 1인 크리에이터</h2>
              <p class="animate__animated animate__fadeInUp">크리에이터가 되기 위한 첫걸음</p>
              <a href="#about" class="btn-get-started animate__animated animate__fadeInUp scrollto">보러가기</a>
            </div>
          </div>
        </div>

      </div>

      <a class="carousel-control-prev" href="#heroCarousel" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon icofont-simple-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>

      <a class="carousel-control-next" href="#heroCarousel" role="button" data-slide="next">
        <span class="carousel-control-next-icon icofont-simple-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>

    </div>
  </section><!-- End Hero -->