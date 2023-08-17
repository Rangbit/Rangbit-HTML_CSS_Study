<%@page import="java.util.Random"%>
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
Random rd = new Random();
request.setCharacterEncoding("UTF-8");
String title = request.getParameter("title"); 
String[] menu = request.getParameterValues("menu");
%>

<fieldset align="center">
   <legend>랜덤당첨 결과</legend>
   <table align="center">
      <tr>
         <td><%=title %></td>        
      </tr>
	  <tr>
		 <td><%= menu[rd.nextInt(menu.length)] %></td>
	  </tr>
   </table>
</fieldset>

</body>
</html>