<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	Hello World
	<!-- HTML -->
	<%-- JSP 
		JSP안에서 자바코드를 사용하고 싶으면 스크립트릿을 사용
	--%>
	<% String name = "name1"; 
	   String result = "";
	   int age = 20;
	   if(age>= 19){
	   		result = "성인";
	   }else{
	   		result = "청소년";
	   }%>
	<br>
	<%-- Java의 값을 web browser에 출력하기 위해 사용 --> 표현식 --%>	
	My name is <%=name %> 이고, 저는 <%=result %> 입니다. <br>
	<hr color="red" size="<%=age%>">
	
	
	
</body>
</html>