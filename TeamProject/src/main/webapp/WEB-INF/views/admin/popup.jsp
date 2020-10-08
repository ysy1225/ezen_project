<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<body>
 <form action="adminBlock.do" method="post">
  정지 사유<br>
  사유<select>
    <option>해킹 및 도용</option>
    <option>언어폭력</option>
    <option>멀웨어,스팸</option>
  </select><br>
  등록일
<input type="date" name="date1"> - <input type="date" name="date2">  
  <textarea rows="10" cols="40"></textarea><br>
  <input type="submit" value="확인">
  <a href="javascript:window.closed();">닫기</a>
  </form>
</body>

</html>