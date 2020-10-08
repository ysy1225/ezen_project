<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/main/top.jsp"%>

  <!-- 로그인 CSS File -->
  <link href="${pageContext.request.contextPath}/resources/login/loginstyle.css?after" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/login/loginmain.css?after" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/login/loginutil.css?after" rel="stylesheet">

  <main id="main">

    <section id="featured-services" class="featured-services section-bg">
      <div class="container">
        
        <!-- ======= 이메일 확인 ======= -->
        <c:if test="${mode == 'id'}">
        <div class="main">
          <section class="signup">
            <div class="container">
              <div class="signup-content">
              
                <form method="POST" id="signup-form" class="signup-form" action="loginPro.do" method="POST" name="f" id="loginForm">
                  <h2 class="form-title" style="margin-bottom: 40px;">회원의 이메일입니다.</h2>
                  <%--이메일 --%>
                  <div align="center" style="margin-bottom: 50px;">
                    <font><c:out value="${userEmail}"/></font>
                  </div>
                  <%--버튼 --%>
                  <div class="form-group">
                    <input type="button" onclick="location.href='mainForm.do'" name="submit" id="submit" class="form-submit" value="돌아가기" style="width: 20%; float: left; margin-left: 10%;"/>
                    <input type="button" onclick="location.href='loginForm.do'" name="submit" id="submit" class="form-submit" value="로그인" style="width: 20%; float: left; margin-left: 50px;"/>
                    <input type="button" onclick="location.href='loginSearch.do?mode=pw'" name="submit" id="submit" class="form-submit" value="pw찾기" style="width: 20%; float: right; margin-right: 10%;"/>
                  </div>
                </form>
                
              </div>
            </div>
          </section>
        </div>
        </c:if>
        
        <!-- ======= 새 비밀번호 설정 ======= -->
        <c:if test="${mode != 'id'}">
        <div class="main">
          <section class="signup">
            <div class="container">
              <div class="signup-content">
              
              <form method="POST" id="signup-form" class="signup-form" action="pwReset.do" method="POST" name="f" id="loginForm">
                <input type="hidden" name="userNum" value="${userNum}">
                <h2 class="form-title" style="margin-bottom: 40px;">새 비밀번호 설정</h2>
                <%-- 비밀번호 --%>
                <div class="form-group">
                  <input type="text" class="form-input" name="userPw1" id="checkpassword" placeholder="Password"/>
                  <span toggle="#password" class="zmdi zmdi-eye field-icon toggle-password"></span>
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