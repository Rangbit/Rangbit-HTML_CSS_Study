<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="kr">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://kit.fontawesome.com/d2846f63b1.js" crossorigin="anonymous"></script>
  <script type="text/javascript">
  	$(document).ready(()=>{
  		if(${not empty msgType}){
  			// 회원가입 시도
  			if(${msgType eq "실패 메세지"}){
  					$("#modal-msgType").css("background-color", "#b81414")

  			}
  			$("#msgModal").modal("show");
  		}
  	});
  
  </script>
  
  <style type="text/css">
  	.table-danger {
  		border-color : #00000000!important;
  	}
  	input[type=radio]{
  		display: none
  	}
  	.btn {
  		border: none!important;
  	}
  	
  	.modal-header {
  		background-color: #b81414!important;
  	}
  	
  	.check-pw-text {
  		color : #b81414;
  	}
  	
  	.check-pw-area {
  		display : none;
  	}
  	
  	.btn-warning {
  		background-color: #FFAAAA!important;
  	}
  	
  	#modal-msgType label {
  		color : #FFFFFF;
  	}

  </style>
</head>
<body>
  <jsp:include page="../components/header.jsp"></jsp:include>
  
  <div class="container">
  <h2>Spring MVC03</h2>
  <div class="panel panel-default">
    <div class="panel-heading">mypage </div>
    <div class="panel-body">
    	<!-- enctype
    		 1)application/x-www-form-urlencoded
    		 	form태그 안에서 보내는 요청데이터를 key:value 형태로 전송
    		 2) multipart/form-data ->>  -->
		<form action="${contextPath}/imageUpdate.do" method="post" enctype="multipart/form-data">
			<table class="table" style="text-align:center; border : 1px solid #00000000">
				<tr class="table-danger" style="width : 110px; vertical-align : middle;">
			        <td>ID</td>
			        <td>
			        	<input type="text" name="memId" id="memId" class="form-control" value="${mvo.memId }" placeholder="ID를 입력해주세요" maxlength="20" readonly="readonly">
			        </td>
		      	</tr>
			
				<tr class="table-danger" style="width : 110px; vertical-align : middle;">
			        <td>사진업로드</td>
			        <td>
			        	<input type="file" accept="image/*" name="memProfile" id="memProfile" class="form-control" placeholder="ID를 입력해주세요" maxlength="20">
			        </td>
		      	</tr>
				<tr class="table-danger img-input_text" style="width : 110px; vertical-align : middle;">
			        <td colspan="2">png, jpg 이미지 파일로 등록해주세요</td>
		      	</tr>
		      	<tr class="table-danger" style="width : 110px; vertical-align : middle;">
		      		<td colspan="2">
		      			<input type="submit" class="btn btn-warning" value="update">
		      		</td>
		      	</tr>
			</table>
		</form>
	</div>
    <div class="panel-footer">Spring Board - name</div>
  </div>
</div>

<!-- Sign up success/fail -->
<!-- The Modal -->
<div class="modal" id="msgModal">
  <div class="modal-dialog">
    <div class="modal-content panel-info">

      <!-- Modal Header -->
      <div id="modal-msgType" class="modal-header">
        <h4 class="modal-title">${msgType }</h4>
        <button type="button" id="modal-fail" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <p id="modal-msg">${msg }</p>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger bg-dark" data-bs-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>

<!-- check id -->
<!-- The Modal -->
<div class="modal" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content panel-info">

      <!-- Modal Header -->
      <div id="checkId" class="modal-header bg-dark">
        <h4 class="modal-title">Message</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <p id="checkMessage"></p>
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

