<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/main/top.jsp"%>

  <!-- 로그인 CSS File -->
  <link href="${pageContext.request.contextPath}/resources/login/loginstyle.css?after" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/login/loginmain.css?after" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/login/loginutil.css?after" rel="stylesheet"> 

  <main id="main">

    <!-- ======= Featured Services Section ======= -->
    <section id="featured-services" class="featured-services section-bg">
      <div class="container">

        <div class="main">
          <section class="signup">
            <div class="container">
              <div class="signup-content">
              
                <form method="POST" id="signup-form" class="signup-form" action="loginPro.do" method="POST" name="f" id="loginForm" onsubmit="return loginCheck(this)">
                  <h2 class="form-title" style="margin-bottom: 40px;">로그인</h2>
                    <%--이메일 --%>
                    <div class="form-group">
                      <input type="email" class="form-input" name="userEmail" id="useremail" placeholder="Example@example.com" style="width: 100%;"/>
                      <span class="error" id="errMsg_02"></span>
                    </div>
                    <%--비밀번호 --%>
                    <div class="form-group">
                      <input type="password" class="form-input" name="userPw1" id="userpassword" placeholder="Password"/>
                      <span toggle="#password" class="zmdi zmdi-eye field-icon toggle-password"></span>
                      <span class="error" id="errMsg_04"></span>
                    </div>
                    <%--체크  --%>
                    <div class="form-group">
                      <div class="contact100-form-checkbox">
			            <input class="input-checkbox100" id="ckb1" type="checkbox" name="remember-me">
			            <label class="label-checkbox100 txt1" for="ckb1" style="font-family: 'S-CoreDream-2ExtraLight';">이메일 기억하기</label>
		                <a href="joinForm.do" class="txt1" style="font-color: black; float: right; margin-top: 7px; color: #400080;">회원이 아니십니까?</a>
		              </div>
                    </div>
                    <%--로그인 버튼 --%>
                    <div class="form-group">
                      <input type="submit" name="submit" id="submit" class="form-submit" value="로그인"/>
                    </div>
                </form>
        
                <div class="flex-sb-m w-full p-t-3 p-b-24" style="padding-left: 39%; padding-right: 20%;">
                  <div class="conconcon">
		            <button onclick="location.href='loginSearch.do?mode=id'">ID찾기</button> /
			        <button onclick="location.href='loginSearch.do?mode=pw'">PW찾기</button>
                  </div>
                </div>
                
              </div>
            </div>
          </section>
        </div>

      </div>
    </section><!-- End Featured Services Section -->
    
  </main>

<%@ include file="/WEB-INF/views/main/bottom2.jsp"%>