<%@page import="com.board.entity.Board"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
 
<div class="container">
  <h2>Spring MVC01</h2>
  <div class="panel panel-default">
    <div class="panel-heading">Board</div>
    <div class="panel-body">
		<table class="table table-bordered table-hover">
			<tr>
				<td>글번호</td>
				<td>제목</td>
				<td>작성자</td>
				<td>작성일자</td>
				<td>조회수</td>
			</tr>
			
			<!-- 
				 BoardController에서 받아온 list데이터를
				 for문을 사용해서 아래에 tr, td로 출력해보기
			 -->
			<%List<Board> list = (List<Board>)request.getAttribute("list"); %>
<%-- 			<%for(int i = 0; i < list.size(); i++){%>
			<tr>
				<td><%=list.get(i).getIdx() %></td>
				<td><%=list.get(i).getTitle() %></td>
				<td><%=list.get(i).getWriter() %></td>
				<td><%=list.get(i).getIndate() %></td>
				<td><%=list.get(i).getCount() %></td>
			</tr>
			<%} %> --%>
<%-- 			<%for(Board vo : list){ %>
			<tr>
				<td><%=vo.getIdx() %></td>
				<td><%=vo.getTitle() %></td>
				<td><%=vo.getWriter() %></td>
				<td><%=vo.getIndate() %></td>
				<td><%=vo.getCount() %></td>
			</tr>
			<%} %> --%>
			<!-- EL문법으로 출력 -->
			<c:forEach var="vo" items="${list}" varStatus="s">
				<tr>
					<td>${s.count}</td>
					<td><a href="boardContent.do?idx=${vo.idx}">${vo.title}</a></td>
					<td>${vo.writer}</td>
					<td>${vo.indate}</td>
					<td>${vo.count}</td>
				</tr>	
			</c:forEach>
		</table>
		<a href="boardForm.do" class="btn btn-primary">글쓰기</a>
	</div>
    <div class="panel-footer">Spring Board - name</div>
  </div>
</div>


</body>
</html>
