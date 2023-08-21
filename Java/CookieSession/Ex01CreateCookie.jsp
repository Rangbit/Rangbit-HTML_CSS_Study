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
	// 쿠키객체 생성(name,value)
	Cookie cookie = new Cookie("test","cookie");
	
	// 유효기간 설정(초단위)
	cookie.setMaxAge(60*60*24*365);
	
	// 클라이언트에게 쿠키 전송(서버->클라이언트)
	response.addCookie(cookie);
	
	// 쿠키를 생성하면서 전송
	response.addCookie(new Cookie("test2","cookie2"));
	%>
	
	<a href="Ex02GetCookie.jsp">쿠키 확인</a>

</body>
</html>