<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>
  <title>전화번호 인증</title>
</head>

<body>
  <h4>전화번호 등록</h4>
  <input type="tel" name="userPhone" id="inputPhoneNumber" value="${phonenum}">
  <input type="button" id="sendPhoneNumber2" value="인증 번호 전송"><br>
  <input type="text" id="inputCertifiedNumber">
  <input type="button" id="checkBtn" value="확인">
  
  <script src="${pageContext.request.contextPath}/resources/jquery-3.5.1.min.js"></script>
  <script type="text/javascript">
    var phck = 0;
    $('#sendPhoneNumber2').click(function() {
	  var userPhone = $('#inputPhoneNumber').val();
	  swal('인증번호 발송 완료');
			    
	  $.ajax({
	    type: "get",
	    url: "sendSMS.do?userPhone=" + userPhone,
	    data: { "userPhone" : userPhone },
	    success: function(res) {
		  $('#checkBtn').click(function() {
		    if ($.trim(res) == $('#inputCertifiedNumber').val()) {
			  alert('인증 성공');
			  window.opener.document.getElementById("phone").value = userPhone;
			  window.opener.$('#phone').prop('readonly', true);
			  window.close();
			          
			  $.ajax({
			    type: "get",
			    url: "joinForm.do?userPhone=" + userPhone,
			    data: { "userPhone" : $('#inputPhoneNumber').val() },
			    success: function() {
			      window.opener.parent.location.href="joinForm.do?userPhone=" + userPhone + phck;
			      phck = 1;
			    }
			  });
			  /*document.location.href = "joinForm.do";*/
			} else {
			  swal({
			    icon: 'error',
			    title: '인증 오류',
			    text: '인증번호가 올바르지 않습니다.',
			    footer: '<a href="joinForm.do">다음에 인증하기</a>'
			  });
			}
	      });
		}
      });
    });
  </script>
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</body>

</html>