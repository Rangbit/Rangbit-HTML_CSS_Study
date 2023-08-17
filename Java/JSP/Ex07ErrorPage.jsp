<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body align="center">
	<img alt="" src="./error.png" width="600px">
	<h1>Sorry</h1>
	Error Code : <%= exception.getMessage() %>

</body>
</html>