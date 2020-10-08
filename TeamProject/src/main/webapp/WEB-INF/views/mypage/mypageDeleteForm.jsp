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
              
                <form method="POST" id="signup-form" class="signup-form" action="myPageDeleteOk.do" method="POST" name="f" id="loginForm" onsubmit="return pwCheck(this)">
                  <h2 class="form-title" style="margin-bottom: 40px;">회원탈퇴</h2>
                    <%--아이디 --%>
                    <div class="form-group">
                      <input type="text" class="form-input" name="userEmail" value="${mbId}" readOnly>
                    </div>
                    <%--비밀번호 --%>
                    <div class="form-group">
                      <input type="password" class="form-input" name="userPw1" id="userpassword" placeholder="Password"/>
                      <input type="hidden" name="userEmail" value="${mbId}">
                      <span toggle="#password" class="zmdi zmdi-eye field-icon toggle-password"></span>
                      <span class="error" id="errMsg_04"></span>
                    </div>
                    <%--로그인 버튼 --%>
                    <div class="form-group">
                      <input type="submit" name="submit" id="submit" class="form-submit" value="회원탈퇴"/>
                    </div>
                </form>
                
              </div>
            </div>
          </section>
        </div>

      </div>
    </section><!-- End Featured Services Section -->
    
  </main>

<%@ include file="/WEB-INF/views/main/bottom2.jsp"%>