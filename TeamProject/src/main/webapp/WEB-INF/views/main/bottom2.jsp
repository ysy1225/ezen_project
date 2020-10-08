<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- ======= Footer ======= -->
  <footer id="footer">
    <div class="container">
      <h3>ezen project</h3>
      <p>Et aut eum quis fuga eos sunt ipsa nihil. Labore corporis magni eligendi fuga maxime saepe commodi placeat.</p>
      <div class="social-links">
        <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
        <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
        <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
        <a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
        <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
      </div>
      <div class="copyright">
        &copy; Copyright <strong><span>Ezen</span></strong>. All Rights Reserved
      </div>
      <div class="credits">
        <!-- All the links in the footer should remain intact. -->
        <!-- You can delete the links only if you purchased the pro version. -->
        <!-- Licensing information: https://bootstrapmade.com/license/ -->
        <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/green-free-one-page-bootstrap-template/ -->
        Designed by <a href="#">Team(C)</a>
      </div>
    </div>
  </footer><!-- End Footer -->

  <a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>

  <!-- Vendor JS Files -->
  <script src="${pageContext.request.contextPath}/resources/main/mainvendor/jquery/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/main/mainvendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/main/mainvendor/jquery.easing/jquery.easing.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/main/mainvendor/php-email-form/validate.js"></script>
  <script src="${pageContext.request.contextPath}/resources/main/mainvendor/owl.carousel/owl.carousel.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/main/mainvendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/main/mainvendor/venobox/venobox.min.js"></script>
  <script src="https://unpkg.com/ionicons@5.1.2/dist/ionicons.js"></script>

  <!-- 메인 JS File -->
  <script src="${pageContext.request.contextPath}/resources/main/main.js"></script>
  
  <!-- 로그인 JS File -->
  <script src="${pageContext.request.contextPath}/resources/login/login-main.js"></script> 
  <script src="${pageContext.request.contextPath}/resources/login/login-cookie.js"></script>
  <script src="${pageContext.request.contextPath}/resources/login/login-test.js"></script> 
  <script src="${pageContext.request.contextPath}/resources/login/login-pwcheck.js"></script>
  <script src="${pageContext.request.contextPath}/resources/join/test.js"></script>
  
  <!-- 로그인 공백 유효성 검사 -->
  <script type="text/javascript">	
	function loginCheck() {
		if (f.userEmail.value == "") {
			alert("이메일을 입력해 주세요!!")
			f.userEmail.focus()
			return false;
		}
		if (f.userPw1.value == "") {
			alert("비밀번호를 입력해 주세요!!")
			f.userPw1.focus()
			return false;
		}
	}
	function pwCheck() {
		if (f.userPw1.value == "") {
			alert("비밀번호를 입력해 주세요!!")
			f.userPw1.focus()
			return false;
		}
	}
  </script>

</body>

</html>