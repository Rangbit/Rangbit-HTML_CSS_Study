<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
	String id = (String)session.getAttribute("id"); // DownCastiong
	int age = (int)session.getAttribute("age");
	%>

	ID : <%=id %><br>
	Age : <%=age %>

</body>
</html>