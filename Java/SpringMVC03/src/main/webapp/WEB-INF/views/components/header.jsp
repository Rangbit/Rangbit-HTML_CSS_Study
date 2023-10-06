<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="kr">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
  
  <style type="text/css">
  
  .navbar {
  	margin-bottom: 50px;
  }
  
  .bg-dark {
  	background-color: #FFAAAA!important;
  }
  
  a {
  	text-decoration: none;
  }
  
  .navbar-collapse {
  	justify-content: space-between;
  }
  
  .navbar-nav>li{
  	padding: 0 20px;

  }
  
  .navbar-nav>li>a {
    color : #000000;
  }

  .navbar-inverse {
  	background-color : #FFAAAA;
  }
  
  .navbar-inverse .navbar-nav>li>a,
  .navbar-inverse .navbar-brand {
  	color : #000000;
  }
  
  </style>
  
<script type="text/javascript">

function hamberger(){
	if($(".navbar-toggler").attr("aria-expanded", "true")){
		$(".navbar-toggler").attr("aria-expanded", "false")
	}
}

</script>
  
</head>
<body>
<!-- 변수를 만드는 태그 -->
<!-- 경로를 잡아주는 용도 -->
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>


<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="${contextPath }/">Spring</a>
    <button onclick="hamberger()" class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="collapsibleNavbar">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link" href="boardMain.do">Board</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Link</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Link</a>
        </li>  
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">Dropdown</a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#">Link</a></li>
            <li><a class="dropdown-item" href="#">Another link</a></li>
            <li><a class="dropdown-item" href="#">Board</a></li>
          </ul>
        </li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a class="nav-link" href="${contextPath }/joinForm.do"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
        <li><a class="nav-link" href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      </ul>
      
    </div>
  </div>
</nav>

</body>
</html>


