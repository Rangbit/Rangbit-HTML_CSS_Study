<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body align = "center">

	Main page <br><br>
	<a href="Ex08SubPage.jsp">Sub page</a><br><br>
	<!-- include 지시자 : 현재 페이지에 다른 파일의 내용을 삽입할 때(header, nav, footer) -->
	<%@ include file="Ex08Footer.jsp" %>


</body>
</html>