<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<%pageContext.setAttribute("newLine", "\n"); %>

	<div class="container">
		<h2>Spring MVC01</h2>
		<div class="panel panel-default">
			<div class="panel-heading">Board</div>
			<div class="panel-body">
				<table class="table">
					<!-- title, content, writer -->
						<tr>
							<td>제목</td>
							<td>${convo.title}</td>
						</tr>
						<tr>
							<td>내용</td>
							<td>${fn:replace(convo.content, newLine, "<br>") }</td>
						</tr>
						<tr>
							<td>작성자</td>
							<td>${convo.writer}</td>
						</tr>
						<tr>
							<td>작성일</td>
							<td>${fn:split(convo.indate, " ")[0] }</td>
						</tr>
					<tr>
						<td colspan="2" align="center">
							<a href="boardSelectList.do" class="btn btn-primary">목록</a>
							<a href="boardUpdate.do/${convo.idx}" class="btn btn-success">수정</a>
							<a href="boardDelete.do?idx=${convo.idx}" class="btn btn-warning">삭제</a>
						</td>
					</tr>
				</table>
			</div>
			<div class="panel-footer">Spring Board - name</div>
		</div>
	</div>


</body>
</html>
