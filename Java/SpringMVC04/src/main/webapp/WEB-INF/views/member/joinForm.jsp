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
  
  	function  registerCheck(){
  		// id 중복체크
  		let memId =$("#memId").val();
  		
  		// MemberController 에서 registerCheck.do라고 비동기 요청시
  		// 해당 아이디가 존재하면 0반환, 존재하지 않으면 1반환
  		
  		// 체크하는방법
  		// 해당 memId가 일치하는 회원의 정보를 가져옴(Member)
  		// 있으면 객체를 반환, 없으면 null 일것
  		// null -> 1반환(사용가능) / null(X) -> 0반환(사용불가)
  		
  		// 만들어야 하는것
  		// MemberMapper.java, MemberMapper.xml 파일 만들기
  		$.ajax({
  			url : "${contextPath}/registerCheck.do",
  			type : "get",
  			data : {"memId" : memId},
  			success : function(data){
  				console.log(data);
  				if(data == 1){
  					$("#checkMessage").text("사용할 수 있는 아이디입니다.")
  					// id=checkId -> class ="modal-content panel primary"
  					/* $("#checkId").attr("class", "modal-header bg-dark"); */
  				    $('#checkId').hover(function(){
  				        $(this).attr("class", "modal-header bg-primary");
  				    }, function() {
  				        $(this).attr("class", "modal-header bg-dark");
  				    });
  					
  				}else{
  					$("#checkMessage").text("사용할 수 없는 아이디입니다.")  					
  					$("#checkId").attr("class", "modal-header")
  				}
  				$("#myModal").modal("show");
  			},
  			error : (error)=>{console.log("error : ", error);}
  		});
  		
  	}
  	
  	function pwCheck(){
  		
  		// 비밀번호가 일치하는지 확인
  		let memPw1 = $("#memPw1").val();
  		let memPw2 = $("#memPw2").val();
  		
  		if(memPw1 != memPw2){
  			// 비밀번호 일치 X
  			$(".check-pw-area").css("display" , "table-row");
  			$(".check-pw-text").html('<i class="fa-solid fa-triangle-exclamation 2x" style="color: #ff0000;"></i><span>비밀번호가 일치하지 않습니다.</span>');  			
  		}else {  			
  			$(".check-pw-area").css("display" , "table-row");
  			$(".check-pw-text").html('<i class="fa-solid fa-check 2x" style="color: #00ff40;"></i><span>비밀번호가 일치 합니다.<span>');
  			$("#memPw").val(memPw1);
  		}
  		
  	}
  	
  	
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
    <div class="panel-heading"> </div>
    <div class="panel-body">
		<form action="${contextPath}/join.do" method="post">
		
			<input type="hidden" id="memPw" name="memPw" value="">
			<table class="table" style="text-align:center; border : 1px solid #00000000">
				<tr class="table-danger" style="width : 110px; vertical-align : middle;">
			        <td>ID</td>
			        <td>
			        	<input type="text" name="memId" id="memId" class="form-control" placeholder="ID를 입력해주세요" maxlength="20">
			        </td>
			        <td style="width : 110px;">
			        	<button onclick="registerCheck()" type="button" class="btn btn-sm btn-warning">중복확인</button>
			        </td>
		      	</tr>
				<tr class="table-danger" style="width : 110px; vertical-align : middle;">
			        <td>PW</td>
			        <td>
			        	<input onkeyup="pwCheck()" type="password" name="memPw1" id="memPw1" class="form-control" placeholder="비밀번호를 입력해주세요" maxlength="20">
			        </td>
			        <td></td>
		      	</tr>
				<tr class="table-danger" style="width : 110px; vertical-align : middle;">
			        <td></td>
			        <td>
			        	<input onkeyup="pwCheck()" type="password" name="memPw2" id="memPw2" class="form-control" placeholder="비밀번호를 다시 입력해주세요" maxlength="20">
			        </td>
			        <td></td>
		      	</tr>
				<tr class="table-danger check-pw-area" style="width : 110px; vertical-align : middle;">
			        <td></td>
			        <td class="check-pw-text"></td>
			        <td></td>
		      	</tr>
				<tr class="table-danger" style="width : 110px; vertical-align : middle;">
			        <td>Name</td>
			        <td>
			        	<input type="text" name="memName" id="memName" class="form-control" placeholder="이름을 입력해주세요" maxlength="20">
			        </td>
			        <td></td>
		      	</tr>
				<tr class="table-danger" style="width : 110px; vertical-align : middle;">
			        <td>Age</td>
			        <td>
			        	<input type="number" name="memAge" id="memAge" class="form-control" placeholder="나이를 입력해주세요" maxlength="20">
			        </td>
			        <td></td>
		      	</tr>
				<tr class="table-danger" style="width : 110px; vertical-align : middle;">
			        <td>Gender</td>
			        <td>
			        	<div class="form-group" style="text-align: center; vertical-align: center; margin: 0 auto;">
			        		<div class="btn-group" data-toggle="buttons">
			        			<label class="btn btn-warning active">
			        				<input type="radio" id="memGender-male" name="memGender" value="male" checked>
			        				male
			        			</label>
			        			<label class="btn btn-warning" >
			        				<input type="radio" id="memGender-female" name="memGender" value="female">
			        				Female
			        			</label>
			        		</div>
			        	</div>
			        </td>
			        <td></td>
		      	</tr>
				<tr class="table-danger" style="width : 110px; vertical-align : middle;">
			        <td>Email</td>
			        <td>
			        	<input type="email" name="memEmail" id="memEmail" class="form-control" placeholder="이메일을 입력해주세요" maxlength="20">
			        </td>
			        <td></td>
		      	</tr>
		      	<tr class="table-danger" style="width : 110px; vertical-align : middle;">
		      		<td></td>
		      		<td>
		      			<input type="submit" class="btn btn-warning" value="submit">
		      			<input type="reset" class="btn btn-warning" value="reset">
		      		</td>
		      		<td></td>
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

