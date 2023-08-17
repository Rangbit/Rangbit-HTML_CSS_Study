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
	int sum = 10;
	%>
	
	<%!
	public String isOdd(int sum){
		
		if (sum%2==0){
		return "짝수";			
		}else {
		return "홀수";			
		}
	}
	%>
	sum 은 <%=isOdd(sum)%>입니다


</body>
</html>