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
  <script src="https://kit.fontawesome.com/d2846f63b1.js" crossorigin="anonymous"></script>
  
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
  
  .fa-solid {
  	padding-right: 5px;
  }
  
  .user-img {
  	display : flex;
  	justify-content: center;
  	align-items: center;
  }
  
  .user-img img {
  	width: 30px;
  	height : 30px;
  	border-radius: 50%;
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
      
      <c:if test="${empty mvo}">
	  <ul class="nav navbar-nav navbar-right">
        <li><a class="nav-link" href="${contextPath }/joinForm.do"><span class="glyphicon glyphicon-user"></span><i class="fa-solid fa-user"></i> Sign Up</a></li>
        <li><a class="nav-link" href="${contextPath }/loginForm.do"><span class="glyphicon glyphicon-log-in"></span><i class="fa-solid fa-arrow-right-from-bracket"></i> Login</a></li>
      </ul>
      </c:if>
      
      <c:if test="${not empty mvo}">
      <ul class="nav navbar-nav navbar-right">
      	<c:if test="${not empty mvo.memProfile }">
      		<div class="user-img">
      			<img alt="" src="${contextPath }/resources/profile/${mvo.memProfile}">
      		</div>
      	</c:if>
      	<c:if test="${empty mvo.memProfile }">
      		<div class="user-img">
      			<img alt="" src="${contextPath }/resources/images/default-user-image.png">
      		</div>
      	</c:if>
        <li><a class="nav-link" href="${contextPath }/updateForm.do"><span class="glyphicon glyphicon-user"></span><i class="fa-solid fa-user"></i>Mypage</a></li>
        <li><a class="nav-link" href="${contextPath }/imageForm.do"><span class="glyphicon glyphicon-log-in"></span><i class="fa-solid fa-image"></i>Profile</a></li>
        <li><a class="nav-link" href="${contextPath }/logout.do"><span class="glyphicon glyphicon-log-in"></span><i class="fa-solid fa-arrow-right-from-bracket"></i>Logout</a></li>
      </ul>
      </c:if>
    </div>
  </div>
</nav>

</body>
</html>


