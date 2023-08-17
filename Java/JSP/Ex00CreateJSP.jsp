<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- servlet에서 
    	 데이터 자체를 인코딩 : setCharacterEncoding 
    	 웹 브라우저한테 인코딩 방식 알려주기 : response.setContentType("");
    	 
    	 jsp에서
    	 contentType : 웹 브라우저한테 형식은 text형식이고 html파일,
    	 			   인코딩 방식은 UTF-8이라고 알려주는 역할
    	 pageEncoding : JSP 소스코드 자체를 인코딩 하는것 -->
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- JSP파일 -> Servlet 파일로 변환 -> 톰캣이 html파일로 만들어줌 -->
	<h1>hello</h1>
	
</body>
</html>