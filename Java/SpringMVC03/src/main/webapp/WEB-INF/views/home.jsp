<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
  			// 회원가입 성공
  			if(${msgType eq "성공 메세지"}){
  					$("#modal-msgType").css("background-color", "#FFAAAA")
  			}
  			$("#msgModal").modal("show");
  		}
  	});
	</script>

</head>
<body>
<jsp:include page="components/header.jsp"></jsp:include>
  
<div class="container">
  <h3>Collapsible Navbar</h3>
  <p>In this example, the navigation bar is hidden on small screens and replaced by a button in the top right corner (try to re-size this window).
  <p>Only when the button is clicked, the navigation bar will be displayed.</p>
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