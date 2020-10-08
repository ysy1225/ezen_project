<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
      <div class="copyright" style="margin-right: 60px;">
        &copy; Copyright <strong><span>Ezen</span></strong>. All Rights Reserved
      </div>
      <div class="credits" style="margin-right: 60px;">
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
  
  <!-- 튜터등록 버튼 클릭 시 -->
  <script type="text/javascript">
	function checkLogin2() {
		var id = '${mbId}';
		
		if(id == '') {
			alert("로그인이 필요합니다.");
			location.href = 'loginForm.do';
		}
		if(id != '') {
			location.href = 'tutorInputForm.do';			
		}
	}
    function list(page) {
    	location.href="listNotice.do?curPage="+page+"&searchOption-${map.searchOption}"+"&keyword=${map.keyword}";
    }
  </script>

</body>

</html>