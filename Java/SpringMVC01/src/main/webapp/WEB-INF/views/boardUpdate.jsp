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
		<form action="../boardUpdateWrite.do" method="post">
			<table class="table">
				<!-- title, content, writer -->
				<input type="hidden" name="idx" value="${convo.idx}">
				<tr>
					<td>제목</td>
					<td><input type="text" name="title" value="${convo.title}" class="form-control"></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea rows="20" cols="" name="content" class="form-control">${convo.content}</textarea></td>
				</tr>
				<tr>
					<td>작성자</td>
					<td><input type="text" name="writer" value="${convo.writer}" class="form-control" readonly></td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
						<button type="submit" class="btn btn-success">수정</button>
						<a href="../boardSelectList.do" class="btn btn-primary">목록</a>
					</td>
				</tr>
			</table>
		</form>
	</div>
    <div class="panel-footer">Spring Board - name</div>
  </div>
</div>


</body>
</html>
