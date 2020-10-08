<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/views/main/top.jsp"%>
    <div style="margin:250px">
<a href="community.do">목록</a>
<form action="updateCom.do?comNum=${dto.comNum }" method="post">
<table width="800">
<tr>
<th>이름</th>
<td>${dto.userName }</td>
<th>카테고리</th>
<td>
<select name="comCate">
<option value="IT">IT</option>
<option value="디자인">디자인</option>
<option value="실무역량">실무역량</option>
<option value="뷰티">뷰티</option>
<option value="외국어">외국어</option>
<option value="음악">음악</option>
<option value="라이프스타일">라이프스타일</option>
<option value="기타">기타</option>
</select>
</td>
<th>제목</th>
<td><input type="text" name="comSubject"></td>
<th>날짜</th>
<td>${dto.comDate }</td>
</tr>
<tr>
<th>내용</th>
<td>
<textarea rows="5" cols="30" name="comContent">${dto.comContent }</textarea></td>
</tr>
</table>
<input type="submit" value="수정">
<input type="reset">
</form>
</div>

<%@ include file="bottom.jsp"%>