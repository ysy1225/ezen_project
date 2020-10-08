<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/main/top.jsp"%>

  <main id="main">
  
    <!-- ======= 배너 ======= -->
    <section id="hero">
      <div id="heroCarousel" class="carousel slide carousel-fade" data-ride="carousel">

      <div class="carousel-inner" role="listbox">

        <!-- Slide 1 -->
        <div class="carousel-item active" style="background-image: url(${pageContext.request.contextPath}/resources/main/img/slide/tutorbanner.jpg)">
          <div class="carousel-container">
            <div class="container" align="center">
              <img src="${pageContext.request.contextPath}/resources/main/img/bannerlogo.png" style="margin-bottom: 30px;">
              <h2 class="animate__animated animate__fadeInDown" style="font-size: 35px;">내가 원하는 기술, 원하는 상품을 만들고 싶다면</h2><br>
              <p class="animate__animated animate__fadeInUp">이젠 여기서 매칭해드립니다.<br><br>각 분야별 생산자와 재능이 뛰어난 튜터들과의<br><br>쉽고 간편한 매칭 시스템</p>
              <c:if test="${mbId eq null}">
                <a href="javascript:checkLogin2()" class="btn-get-started animate__animated animate__fadeInUp scrollto">튜터 등록</a>
              </c:if>
              <c:if test="${mbId ne null}">
                <a href="javascript:checkLogin2()" class="btn-get-started animate__animated animate__fadeInUp scrollto">튜터 등록</a>
              </c:if>
            </div>
          </div>
        </div>

      </div>

      </div>
    </section>

    <!-- ======= 등록 방법 ======= -->
    <section id="why-us" class="why-us">
      <div class="container">
      
        <div class="section-title">
          <h2>튜터 등록</h2>
        </div>

        <div class="row no-gutters">          

          <div class="col-lg-4 col-md-6 content-item">
            <span>STEP 1</span>
            <h4>튜터등록 및 심사</h4>
            <p>수업소개를 정성스럽게 작성해주시면 매니저가 확인 후 튜터등록을 도와드립니다.</p>
          </div>

          <div class="col-lg-4 col-md-6 content-item">
            <span>STEP 2</span>
            <h4>수업노출 및 매칭</h4>
            <p>이젠매만의 맞춤추천 알고리즘으로 튜터님의 재능이 더 많은 분들에게 공유될 수 있도록 합니다.</p>
          </div>

          <div class="col-lg-4 col-md-6 content-item">
            <span>STEP 3</span>
            <h4>첫수업 진행 및 정산</h4>
            <p>첫 수업진행 후 3일 이내 수업료를 정산해드립니다.(영업일 기준)</p>
          </div>

        </div>

      </div>
    </section>

    <!-- ======= 광고 소개 ======= -->
    <section id="services" class="services">
      <div class="container">

        <div class="section-title">
          <h2>광고 무료집행</h2>
          <p>인스타그램, 페이스북 등 SNS 광고 무료로 집행해 드립니다. 튜터 홍보가 걱정이시라면 이젠매가 무료로 홍보도 덤으로 해드립니다.</p>
        </div>

        <div class="row">
        
          <div class="col-lg-4 col-md-6 d-flex align-items-stretch" data-aos="zoom-in" data-aos-delay="100">
            <div class="icon-box iconbox-blue">
              <div class="icon">
                <svg width="100" height="100" viewBox="0 0 600 600" xmlns="http://www.w3.org/2000/svg">
                  <path stroke="none" stroke-width="0" fill="#f5f5f5" d="M300,521.0016835830174C376.1290562159157,517.8887921683347,466.0731472004068,529.7835943286574,510.70327084640275,468.03025145048787C554.3714126377745,407.6079735673963,508.03601936045806,328.9844924480964,491.2728898941984,256.3432110539036C474.5976632858925,184.082847569629,479.9380746630129,96.60480741107993,416.23090153303,58.64404602377083C348.86323505073057,18.502131276798302,261.93793281208167,40.57373210992963,193.5410806939664,78.93577620505333C130.42746243093433,114.334589627462,98.30271207620316,179.96522072025542,76.75703585869454,249.04625023123273C51.97151888228291,328.5150500222984,13.704378332031375,421.85034740162234,66.52175969318436,486.19268352777647C119.04800174914682,550.1803526380478,217.28368757567262,524.383925680826,300,521.0016835830174"></path>
                </svg>
                <ion-icon name="logo-instagram" style="font-size: 45px;"></ion-icon>
              </div>
              <h4><a href="">Instagram</a></h4>
              <p>이젠매와 인플루언서의 콜라보, 여러분만의 재능을 한눈에 쏙~ 홍보해 드립니다. 배우는 재미에 빠져보세요.</p>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-md-0" data-aos="zoom-in" data-aos-delay="200">
            <div class="icon-box iconbox-orange">
              <div class="icon">
                <svg width="100" height="100" viewBox="0 0 600 600" xmlns="http://www.w3.org/2000/svg">
                  <path stroke="none" stroke-width="0" fill="#f5f5f5" d="M300,582.0697525312426C382.5290701553225,586.8405444964366,449.9789794690241,525.3245884688669,502.5850820975895,461.55621195738473C556.606425686781,396.0723002908107,615.8543463187945,314.28637112970534,586.6730223649479,234.56875336149918C558.9533121215079,158.8439757836574,454.9685369536778,164.00468322053177,381.49747125262974,130.76875717737553C312.15926192815925,99.40240125094834,248.97055460311594,18.661163978235184,179.8680185752513,50.54337015887873C110.5421016452524,82.52863877960104,119.82277516462835,180.83849132639028,109.12597500060166,256.43424936330496C100.08760227029461,320.3096726198365,92.17705696193138,384.0621239912766,124.79988738764834,439.7174275375508C164.83382741302287,508.01625554203684,220.96474134820875,577.5009287672846,300,582.0697525312426"></path>
                </svg>
                <ion-icon name="logo-facebook" style="font-size: 45px;"></ion-icon>
              </div>
              <h4><a href="">Facebook</a></h4>
              <p>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore</p>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-lg-0" data-aos="zoom-in" data-aos-delay="300">
            <div class="icon-box iconbox-pink">
              <div class="icon">
                <svg width="100" height="100" viewBox="0 0 600 600" xmlns="http://www.w3.org/2000/svg">
                  <path stroke="none" stroke-width="0" fill="#f5f5f5" d="M300,541.5067337569781C382.14930387511276,545.0595476570109,479.8736841581634,548.3450877840088,526.4010558755058,480.5488172755941C571.5218469581645,414.80211281144784,517.5187510058486,332.0715597781072,496.52539010469104,255.14436215662573C477.37192572678356,184.95920475031193,473.57363656557914,105.61284051026155,413.0603344069578,65.22779650032875C343.27470386102294,18.654635553484475,251.2091493199835,5.337323636656869,175.0934190732945,40.62881213300186C97.87086631185822,76.43348514350839,51.98124368387456,156.15599469081315,36.44837278890362,239.84606092416172C21.716077023791087,319.22268207091537,43.775223500013084,401.1760424656574,96.891909868211,461.97329694683043C147.22146801428983,519.5804099606455,223.5754009179313,538.201503339737,300,541.5067337569781"></path>
                </svg>
                <ion-icon name="logo-youtube" style="font-size: 45px;"></ion-icon>
              </div>
              <h4><a href="">Youtube</a></h4>
              <p>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia</p>
            </div>
          </div>

        </div>

      </div>
    </section>

    <!-- ======= Cta Section ======= -->
    <section id="cta" class="cta">
      <div class="container">

        <div class="row">
          <div class="col-lg-9 text-center text-lg-left">
            <h3>번거롭고 복잡한 과정들은 그만</h3>
            <h4 class="col-logo" style="font-size: 20px;">이젠 여기서 매칭해</h4><br>
            <p>이젠매 전문 MD와의 매칭으로 쉽고 간편하게 등록하며 튜터 홍보도 무료로 집행해 주어 회원들의 반응도 크게 이끌어내 드립니다. 성공적인 튜터가 되기위해 지금 당장!</p>
          </div>
          <div class="col-lg-3 cta-btn-container text-center">
            <a class="cta-btn align-middle" href="#">튜터 등록</a>
          </div>
        </div>

      </div>
    </section><!-- End Cta Section -->

  </main><!-- End #main -->

<%@ include file="bottom2.jsp"%>