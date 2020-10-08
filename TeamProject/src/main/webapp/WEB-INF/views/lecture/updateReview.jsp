<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/main/top.jsp" %>

  <div style="margin: 0 auto;">
    <div style="padding: 201px 20%;">

  <h2 align="center">리뷰 수정</h2>

  <table align="center">
    <tr>
      <c:if test="${rev.star == 1 }">
      <td>★☆☆☆☆</td>
      </c:if>
      <c:if test="${rev.star == 2 }">
      <td>★★☆☆☆</td>
      </c:if>
      <c:if test="${rev.star == 3 }">
      <td>★★★☆☆</td>
      </c:if>
      <c:if test="${rev.star == 4 }">
      <td>★★★★☆</td>
      </c:if>
      <c:if test="${rev.star == 5 }">
      <td>★★★★★</td>
      </c:if>
      <td>${rev.revContent }</td>
      <td>${rev.revDate }</td>
    </tr>
  </table>
  
  <form action="updateRev.do" method="post" style="margin: 0 auto; width: 50%;">
    <input type="hidden" name="revNum" value="${param.revNum }">
    <input type="hidden" name="lectureNum" value="${param.lectureNum}">
    <table>
      <tr>
        <td>
          <select name="star">
            <option value="1">★☆☆☆☆</option>
            <option value="2">★★☆☆☆</option>
            <option value="3">★★★☆☆</option>
            <option value="4">★★★★☆</option>
            <option value="5">★★★★★</option>
          </select>
        </td>
        <td><textarea rows="5" cols="30" name="revContent"></textarea></td>
      </tr>
    </table>
    <input type="submit" value="수정">
  </form>
  
    </div>
  </div>

<%@ include file="/WEB-INF/views/main/bottom.jsp" %>