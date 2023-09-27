<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
  <script type="text/javascript">
  	
  $(document).ready(()=>{
	  // HTML 구조가 다 로딩이 된 후에 loadList() 실행
		  loadList();
  });
  
  	function loadList(){
  		// BoardController에서 게시글 전체목록을 가져오는 기능
  		// ajax 사용
  		// JavaScript Object Notation -> JS 객체표현방식
  		// {key : value}
  		$.ajax({
  			url : "boardSelectList.do",
  			type : "get",
  			dataType : "JSON",
  			success : makeView,  // callback
  			error : function(){
  				console.log("error");
  			}
  		});
  		
  	}
  	
  	// 성공 시 실행할 makeView 함수 -> jsp에 데이터를 뿌려주는 함수
  	function makeView(data){ // data = [{},{},{}]
  		console.log(data);
  	
  		let listHtml = "<table class='table table-bordered table-hover'>";
		listHtml += "<tr>";
		listHtml += "<td>글번호</td>";
		listHtml += "<td>제목</td>";
		listHtml += "<td>작성자</td>";
		listHtml += "<td>작성일자</td>";
		listHtml += "<td>조회수</td>";
		listHtml += "</tr>";
		
		// JQuery 반복문
		$.each(data,(index, obj)=>{
			listHtml += "<tr>";
			listHtml += "<td>" + (index + 1) + "</td>";
			listHtml += "<td>" + obj.title + "</td>";
			listHtml += "<td>" + obj.writer + "</td>";
			listHtml += "<td>" + obj.indate + "</td>";
			listHtml += "<td>" + obj.count + "</td>";
			listHtml += "</tr>";
		});
		
		listHtml += "</table>";
		
		listHtml += "<button onclick='goForm()' class='btn btn-outline-primary' align='right'>글쓰기</button>";
		
		$("#view").html(listHtml);
  	}
  	
  	// 글쓰기 버튼 누르면 글쓰기 폼을 보여주는 함수
  	function goForm(){
  		$("#view").css("display", "none")
  		$("#writeForm").css("display", "block")
  	}
  	function goList(){
  		$("#view").css("display", "block")
  		$("#writeForm").css("display", "none")
  	}  
  </script>
  <style type="text/css">
  #view{
	text-align: center;
  }
  </style>
</head>
<body>
 
<div class="container">
  <h2>Spring MVC02</h2>
  <div class="panel panel-default">
    <div class="panel-heading">Board</div>
    <div class="panel-body" id="view">

	</div>
	<!-- 글쓰기 폼 -->
	<div class="panel-body" style="display:none" id="writeForm">
		<form action="">
			<table class="table">
				<tr>
					<td>제목</td>
					<td><input type="text" name="title" id="title" class="form-control"></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea name="content" id="content" class="form-control" rows="15" cols="" ></textarea></td>
				</tr>
				<tr>
					<td>작성자</td>
					<td><input type="text" name="writer" id="writer" class="form-control"></td>
				</tr>
				<tr>
					<td align="center" colspan="2">
						<button type="button" class="btn btn-outline-primary">등록</button>
						<button type="reset" class="btn btn-outline-danger">초기화</button>
						<button onclick="goList()" type="button" class="btn btn-outline-warning">목록</button>
					</td>
				</tr>		
			</table>
		</form>
	</div>
    <div class="panel-footer" align="center">Spring Board - name</div>
  </div>
</div>


</body>
</html>
