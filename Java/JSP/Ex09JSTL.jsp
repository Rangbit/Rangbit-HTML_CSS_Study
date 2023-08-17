<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- taglib 지시자 : 태그 라이브러리를 가져올때 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- prefix : JSTL 태그를 사용할 때 태그 앞에 붙일 접두사
	 uri : 태그 라이브러리의 URI 식별자 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%for(int i = 1; i <= 10; i++){
		out.print(i);
	} %>
	<br>
	<!-- jstl 반복문 -->
	<c:forEach var="i" begin="1" end="10" step="1">
		<!-- EL표기법 : 쿠키나 세션같은 저장할 수 있는 공간에서 그냥 값을 불러오는 방법 -->
		${i}
	</c:forEach>
	
	
</body>
</html>