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
	// 세션값 설정("name",value)
	session.setAttribute("id", "test");
	session.setAttribute("age", 20);
	// 저장시 서버가 세션 자동부여
	%>
	
	<a href="Ex05GetSession.jsp">세션확인</a>

</body>
</html>