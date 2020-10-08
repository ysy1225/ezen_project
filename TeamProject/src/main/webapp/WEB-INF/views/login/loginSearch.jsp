<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/main/top.jsp"%>

  <!-- 로그인 CSS File -->
  <link href="${pageContext.request.contextPath}/resources/login/loginstyle.css?after" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/login/loginmain.css?after" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/login/loginutil.css?after" rel="stylesheet">
  
  <main id="main">

    <section id="featured-services" class="featured-services section-bg">
      <div class="container">
        
        <!-- ======= 이메일 찾기 ======= -->
        <c:if test="${mode == 'id'}">
        <div class="main">
          <section class="signup">
            <div class="container">
              <div class="signup-content">
              
                <form method="POST" id="signup-form" class="signup-form" action="search.do?mode=${mode}" method="POST" name="f" id="loginForm">
                  <h2 class="form-title" style="margin-bottom: 40px;">이메일 찾기</h2>
                  <%--이름 --%>
                  <div class="form-group">
                    <input type="text" class="form-input" name="userName" id="username" placeholder="Your Name"/>
                    <span class="error" id="errMsg_001"></span>
                  </div>
                  <%--휴대폰번호 --%>
                  <div class="form-group">
                    <input type="text" class="form-input" name="userPhone" id="userphone" placeholder="Your Phone(-를 제외한 휴대폰 번호를 입력해주세요)"/>
                    <span class="error" id="errMsg_002"></span>
                  </div>
                  <%--확인 버튼 --%>
                  <div class="form-group">
                    <input type="submit" name="submit" id="usersubmit" class="form-submit" value="확인" style="margin-top: 30px;"/>
                  </div>
                </form>
                
              </div>
            </div>
          </section>
        </div>
        </c:if>
        
        <!-- ======= 비밀번호 찾기 ======= -->
        <c:if test="${mode != 'id'}">
        <div class="main">
          <section class="signup">
            <div class="container">
              <div class="signup-content">
              
              <form method="POST" id="signup-form" class="signup-form" action="search.do?mode=${mode}" method="POST" name="f" id="loginForm">
                <h2 class="form-title" style="margin-bottom: 40px;">비밀번호 찾기</h2>
                <%--이름 --%>
                <div class="form-group">
                  <input type="text" class="form-input" name="userName" id="name" placeholder="Your Name"/>
                  <span class="error" id="errMsg_01"></span>
                </div>
                <%--이메일 --%>
                <div class="form-group">
                  <input type="email" class="form-input" name="userEmail" id="email" placeholder="Example@example.com" style="width: 100%;"/>
                  <span class="error" id="errMsg_02"></span>
                </div>
                <%--휴대폰번호 --%>
                <div class="form-group">
                  <input type="text" class="form-input" name="userPhone" id="phone" placeholder="Your Phone(-를 제외한 휴대폰 번호를 입력해주세요)"/>
                  <span class="error" id="errMsg_03"></span>
                </div>
                <%--확인 버튼 --%>
                <div class="form-group">
                  <input type="submit" name="submit" id="submit" class="form-submit" value="확인" style="margin-top: 30px;"/>
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