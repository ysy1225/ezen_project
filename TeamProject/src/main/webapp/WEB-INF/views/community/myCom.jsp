<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/views/main/top.jsp"%>
    <div style="margin:250px">
<a href="community.do">목록</a>
<table width="800" border="1">
<tr>
<th width="15%">이름</th>
<th width="15%">카테고리</th>
<th width="40%">제목</th>
<th width="20%">날짜</th>
</tr>
<c:if test="${dto eq null }">
<tr>
<td colspan="5">null</td>
</tr>
</c:if>
<c:forEach var="dto" items="${dto }">
<tr>
<td width="15%">${dto.userName }</td>
<td width="15%">${dto.comCate }</td>
<td width="40%"><a href="communityContent.do?comNum=${dto.comNum }">${dto.comSubject }</a></td>
<td width="20%">${dto.comDate }</td>
<tr>
</c:forEach>
</table>
</div>
