<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/main/top.jsp"%>

  <!-- 로그인 CSS File -->
  <link href="${pageContext.request.contextPath}/resources/login/loginstyle.css?after" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/login/loginmain.css?after" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/login/loginutil.css?after" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/join/fonts/material-icon/css/material-design-iconic-font.min.css" rel="stylesheet">
  
  <main id="main">

    <!-- ======= 회원가입 폼 ======= -->
    <section id="featured-services" class="featured-services section-bg">
      <div class="container">

        <div class="main">
          <section class="signup">
            <div class="container">
              <div class="signup-content">
              
                <form method="POST" id="signup-form" class="signup-form" action="insertUsers.do" name="f">
                  <h2 class="form-title" style="margin-bottom: 40px;">회원가입</h2>
                  <%--이름 --%>
                  <div class="form-group">
                    <input type="text" class="form-input" name="userName" id="name" placeholder="Your Name"/>
                    <span class="error" id="errMsg_01"></span>
                  </div>
                  <%--이메일 --%>
                  <div class="form-group">
                    <input type="email" class="form-input" name="userEmail" id="email" placeholder="Your Email" style="width: 80%;"/>
                    <input type="button" id="idChk" onclick="checkId();" value="중복확인" style="width: 20%; float: right; height: 60px;">
                    <span class="error" id="errMsg_02"></span>
                  </div>
                  <%--휴대폰번호 --%>
                  <div class="form-group">
                    <input type="text" class="form-input" name="userPhone" id="phone" placeholder="Your Phone(-를 제외한 휴대폰 번호를 입력해주세요)"/>
                    <span class="error" id="errMsg_03"></span>
                  </div>
                  <%--비밀번호 --%>
                  <div class="form-group">
                    <input type="password" class="form-input" name="userPw1" id="password" placeholder="Password"/>
                    <span class="error" id="errMsg_04"></span>
                  </div>
                  <%--비밀번호 확인 --%>
                  <div class="form-group">
                    <input type="password" class="form-input" name="userPw2" id="re_password" placeholder="Repeat your password"/>
                    <span class="error" id="errMsg_05"></span>
                  </div>
                  <%--이용약관 동의 체크 --%>
                  <div class="form-group">
                    <input type="checkbox" name="agree-term" id="agree-term" class="agree-term" />
                    <label for="agree-term" class="label-agree-term"><span><span></span></span><a href="#" class="term-service">이용약관 </a> 동의</label>
                  </div>
                  <%--회원가입 버튼 --%>
                  <div class="form-group">
                    <input type="submit" name="submit" id="submit" class="form-submit" value="회원가입 하기" onclick="check_form();"/>
                  </div>
                </form>
        
               <p class="loginhere">이미 계정이 있으십니까 ? <a href="loginForm.do" class="loginhere-link">로그인</a></p>
               
               <script type="text/javascript">
                 var idck = 0;
                 function checkId(){                		
                     	var userEmail = $('#email').val();
                     	$.ajax({
                     		async : true,
                     		data : userEmail,
                     		url : "idcheck.do",
                     		type : 'POST',
                     		dataType : "json",
                     		contentType : "application/json; charset=UTF-8",
                     		success : function(data) {                    			
                     			if (data.cnt > 0) {
                     				alert("사용중인 아이디입니다.");
                     				$("#email").focus();
                     			} else {
                     				alert("사용가능한 아이디입니다.");
                     				$("#phone").focus();
                     				idck = 1;
                     			}
                     		}, error : function(error) {
                     			alert("이메일을 입력해주세요.");
                     		}
                     	});
                 }
                 
               //회원가입 버튼을 눌렀을 때
             	$('#submit').click(function(event) {
             		//** 이름 체크 **//
             		var userName = $('#name').val();
             		var nameLen = userName.length;
             		
             		if(nameLen < 1) {
             			$("#errMsg_01").show();
             			$("#errMsg_01").text("이름을 입력해주세요.");
             			$('#name').css('border', '1px solid red');
             			$('#errMsg_01').css('color', 'red');
             			$('#errMsg_01').css('font-size', '12px');
             			event.preventDefault();
             		}else if(!getName.test($('#name').val())){
             			$("#errMsg_01").show();
             			$('#errMsg_01').text('올바른 이름이 아닙니다.');
             			$('#name').css('border', '1px solid red');
             			$('#errMsg_01').css('color', 'red');
             			$('#errMsg_01').css('font-size', '12px');
             			event.preventDefault();
             		}else {
             			$("#errMsg_01").hide();
             		}
             		
             		//** 이메일 체크 **//
             		var userEmail = $('#email').val();
             		var emailLen = userEmail.length;
             		
             		if(emailLen < 1) {
             			$("#errMsg_02").show();
             			$("#errMsg_02").text("이메일을 입력해주세요.");
             			$('#email').css('border', '1px solid red');
             			$('#errMsg_02').css('color', 'red');
             			$('#errMsg_02').css('font-size', '12px');
             			event.preventDefault();
             		}else if(!getEmail.test($('#email').val())){
             			$("#errMsg_02").show();
             			$('#errMsg_02').text('올바른 이메일 형식이 아닙니다.');
             			$('#email').css('border', '1px solid red');
             			$('#errMsg_02').css('color', 'red');
             			$('#errMsg_02').css('font-size', '12px');
             			event.preventDefault();
             		}else {
             			$("#errMsg_02").hide();
             		}
             		
             		//** 휴대폰 번호 체크 **//
             		var userPhone = $('#phone').val();
             		var phoneLen = userPhone.length;
             		
             		if(phoneLen < 1) {
             			$("#errMsg_03").show();
             			$("#errMsg_03").text("휴대폰 번호를 입력해주세요.");
             			$('#phone').css('border', '1px solid red');
             			$('#errMsg_03').css('color', 'red');
             			$('#errMsg_03').css('font-size', '12px');
             			event.preventDefault();
             		}else if(!getPhone.test($('#phone').val())){
             			$("#errMsg_03").show();
             			$('#errMsg_03').text('올바른 휴대폰 번호가 아닙니다.');
             			$('#phone').css('border', '1px solid red');
             			$('#errMsg_03').css('color', 'red');
             			$('#errMsg_03').css('font-size', '12px');
             			event.preventDefault();
             		}else {
             			$("#errMsg_03").hide();
             		}
             		
             		//** 비밀번호 체크 **//
             		var userPw = $('#password').val();
             		var pwLen = userPw.length;
             		
             		if(pwLen < 1) {
             			$("#errMsg_04").show();
             			$("#errMsg_04").text("비밀번호를 입력해주세요.");
             			$('#password').css('border', '1px solid red');
             			$('#errMsg_04').css('color', 'red');
             			$('#errMsg_04').css('font-size', '12px');
             			event.preventDefault();	
             		}else if(!getPw.test($('#password').val())){
             			$("#errMsg_04").show();
             			$('#errMsg_04').text('숫자와 영문자 조합으로 8~20자리를 사용해야 합니다.');
             			$('#password').css('border', '1px solid red');
             			$('#errMsg_04').css('color', 'red');
             			$('#errMsg_04').css('font-size', '12px');
             			event.preventDefault();
             		}else {
             			$("#errMsg_04").hide();
             		}
             		
             		//** 비밀번호 확인 체크 **//
             		var userPw2 = $('#re_password').val();
             		var pw2Len = userPw2.length;
             		
             		if(pw2Len < 1) {
             			$("#errMsg_05").show();
             			$("#errMsg_05").text("비밀번호를 입력해주세요.");
             			$('#re_password').css('border', '1px solid red');
             			$('#errMsg_05').css('color', 'red');
             			$('#errMsg_05').css('font-size', '12px');
             			event.preventDefault();
             		}else if($('#re_password').val() != $('#password').val()){
             			$("#errMsg_05").show();
             			$('#errMsg_05').text('비밀번호가 일치하지 않습니다.');
             			$('#re_password').css('border', '1px solid red');
             			$('#errMsg_05').css('color', 'red');
             			$('#errMsg_05').css('font-size', '12px');
             			event.preventDefault();
             		}else {
             			$("#errMsg_05").hide();
             		}
             		
             		if(!$("#agree-term").is(":checked")) {
             			alert("이용약관을 동의하셔야 합니다.");
             			$('#agree-term').focus();
             			return false;
             		}
             		
             		if(idck == 0) {
                    	alert('아이디 중복체크를 해주세요');
                        return false;
                    } else {
                     	alert("회원가입을 축하합니다");
                     	$("#frm").submit();
                    }
             	});
               </script>
        
              </div>
            </div>
          </section>
        </div>

      </div>
    </section><!-- End Featured Services Section -->
    
  </main>

<%@ include file="/WEB-INF/views/main/bottom2.jsp"%>