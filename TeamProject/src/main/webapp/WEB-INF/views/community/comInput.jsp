<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/main/top.jsp"%>

  <link href="${pageContext.request.contextPath}/resources/sub/lecture2.css?after" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/main/mainvendor/bootstrap/css/bootstrap-grid3.css" rel="stylesheet">

  <div style="margin:200px">
    <form action="insertCom.do" method="post">
      <input type="hidden" name="userNum" value="${getUserNum }">
      <input type="hidden" name="userName" value="${getN }">
      <h3>커뮤니티 글 작성</h3>
      <hr>
      <div style="display: grid;">
        <div style="margin-bottom: 20px;">
          <div style="float: left; width: 15%;" id="tt">제목</div>
          <div style="float: left; width: 20%;">
            <input type="text" name="comSubject" class="intext2">
          </div>
        </div>
      
      <div style="margin-bottom: 20px;">
        <div>
        <div style="float: left; width: 15%;" id="tt">카테고리</div>
        <div style="float: left; width: 20%;">
	    <select name="comCate" class="selsear2">
          <option value="IT">IT</option>
          <option value="디자인">디자인</option>
          <option value="실무역량">실무역량</option>
          <option value="뷰티">뷰티</option>
          <option value="외국어">외국어</option>
          <option value="음악">음악</option>
          <option value="라이프스타일">라이프스타일</option>
          <option value="기타">기타</option>
        </select>
        </div>
        </div>
      </div>
      <div>
        <div>
          <div style="float: left; width: 15%;" id="tt">내용</div>
          <textarea rows="10" cols="80" name="comContent"></textarea>
        </div>
      </div>
      </div>
      <hr>
      <div>
        <input class="ntnbt" type="submit">
        <input class="ntnbt" type="reset">
      </div>
    </form>
  </div>

<%@ include file="bottom.jsp"%>