<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/main/top.jsp"%>

<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body style="margin: 250px 0 0 0;">
<form action="insertFAQ.do" method="post">
<select name="faqCate">
<option value="계정">계정</option>
<option value="결제">결제</option>
<option value="강의">강의</option>
<option value="튜터">튜터</option>
</select><br>
<input type="text" name="faqSubject"><br>
<textarea rows="10" cols="30" name="faqContent"></textarea><br>
<input type="submit" value="전송">
<input type="reset" value="다시쓰기">
</form>
</body>
</html>