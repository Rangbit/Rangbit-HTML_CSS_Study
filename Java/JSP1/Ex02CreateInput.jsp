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
request.setCharacterEncoding("UTF-8");
int num = Integer.parseInt(request.getParameter("num")); 
%>
<form action="Ex02RandomWinner.jsp">
<fieldset align="center">
   <legend>랜덤당첨 작성</legend>
   <table align="center">
      <tr>
         <td>주제</td>
         <td><input type="text" name="title"></td>         
      </tr>
      <%
      for(int i = 1; i <= num; i++){      
      %>
      <tr>
         <td>아이템<%=i %> :</td>
         <td><input type="text" name="menu"></td>
      </tr>
      <%
      }
      %>
	<tr>
		<td><input type="submit" value="시작"></td>
	</tr>
   </table>
</fieldset>
</form>
</body>
</html>