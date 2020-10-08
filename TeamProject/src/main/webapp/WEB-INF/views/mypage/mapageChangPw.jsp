<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/main/top.jsp"%>

  <!-- 로그인 CSS File -->
  <link href="${pageContext.request.contextPath}/resources/login/loginstyle.css?after" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/login/loginmain.css?after" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/login/loginutil.css?after" rel="stylesheet">

  <main id="main">

    <section id="featured-services" class="featured-services section-bg">
      <div class="container">
        
        <!-- ======= 새 비밀번호 설정 ======= -->
        <c:if test="${mode != 'id'}">
        <div class="main">
          <section class="signup">
            <div class="container">
              <div class="signup-content">
              
              <form method="POST" id="signup-form" class="signup-form" action="pwReset.do" method="POST" name="f" id="loginForm">
                <input type="hidden" name="userNum" value="${getUserNum}">
                <h2 class="form-title" style="margin-bottom: 40px;">새 비밀번호 설정</h2>
                <%-- 비밀번호 --%>
                <div class="form-group">
                  <input type="password" class="form-input" name="userPw1" id="checkpassword" placeholder="Password"/>
                  <span class="error" id="errMsg_004"></span>
                </div>
                <%-- 비밀번호 확인 --%>
                <div class="form-group" style="margin-bottom: 50px;">
                  <input type="password" class="form-input" name="userPw2" id="check_re_password" placeholder="Repeat your password"/>
                  <span class="error" id="errMsg_005"></span>
                </div>
                <%--확인 버튼 --%>
                <div class="form-group">
                  <input type="submit" name="submit" id="checksubmit" class="form-submit" value="확인"/>
                </div>
              </form>
              
              </div>
            </div>
          </section>
        </div>
        </c:if>

      </div>
    </section>
    
  </main>

<%@ include file="/WEB-INF/views/main/bottom2.jsp"%>