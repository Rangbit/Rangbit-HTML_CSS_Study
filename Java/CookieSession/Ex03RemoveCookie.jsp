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
	// 쿠키 생성 (삭제x 덮어씌워서 유효기간을 세션으로)
	Cookie cookie = new Cookie("test","");
	
	// 유효기간 0
	cookie.setMaxAge(0);
	
	// 클라이언트로 전송
	response.addCookie(cookie);
	%>
	
	<a href="Ex02GetCookie.jsp">쿠키 확인</a>

</body>
</html>