<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="kr">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<!--   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  --> 
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://kit.fontawesome.com/d2846f63b1.js" crossorigin="anonymous"></script>

	<script type="text/javascript">
  	$(document).ready(()=>{
  		if(${not empty msgType}){
  			// 로그인 성공
  			if(${msgType eq "로그인성공"}){
  				$("#modal-msgType").css("background-color", "#FFAAAA")
  			}else if(${msgType eq "로그인실패"}){
  				$("#modal-msgType").css("background-color", "#9370DB")  				
  			}
  			$("#msgModal").modal("show");
  		}
  	});
	</script>
	
	<style type="text/css">
		container {
			width: 100%;
		}
		
		.btn {
  			border: none!important;
  		}
  		
  		.con-imgbox img {
  			width: 100%;
  		}
	</style>

</head>
<body>
<jsp:include page="components/header.jsp"></jsp:include>
  
<div class="container">
  	<div class="con-imgbox">
  		<img alt="" src="${contextPath}/resources/images/main.png">
  	</div>
  	<div>
	  	<ul class="nav nav-tabs">
		    <li class="nav-item">
		      <a class="nav-link active" href="#">Active</a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link" href="Board">Board</a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link" href="#notification">notification</a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link disabled" href="#">Disabled</a>
		    </li>
	 	</ul>
  	</div>
  	<div id="board">
  		<h2>Board</h2>
  		<div style="height: 600px">test</div>
  	</div>
  	<div id="notification">
  		<h2>notification</h2>
  		<div style="height: 600px">test</div>
  	</div>
</div>

<!-- Sign up success/fail -->
<!-- The Modal -->
<div class="modal" id="msgModal">
  <div class="modal-dialog">
    <div class="modal-content panel-info">

      <!-- Modal Header -->
      <div id="modal-msgType" class="modal-header">
        <h4 class="modal-title">${msgType}</h4>
        <button type="button" id="modal-fail" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <p id="modal-msg">${msg}</p>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger bg-dark" data-bs-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>

</body>
</html>