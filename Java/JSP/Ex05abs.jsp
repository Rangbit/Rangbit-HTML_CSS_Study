<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%!
		// 절댓값 구하는 메소드 만들기
		public int abs(int num){
		
		if(num < 0) {
			num *= -1;
		}
		
		return num;
	}
	%>

	<%= abs(-5) %>

</body>
</html>