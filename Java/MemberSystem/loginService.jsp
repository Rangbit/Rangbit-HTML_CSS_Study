<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		// 입력한 id와 pw가 일치하는 회원을 삭제
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		int cnt = 0;

		// 사용하는 DBMS에 맞는 드라이버를 로딩
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		// 드라이버를 통해서 내가 사용하는 DBMS와의 연결
		// 데이터 베이스를 연결하기위해서는 현재내가 사용하는 DBMS의 주소, 계정, 비밀번호가 필요하다
		String db_url = "jdbc:oracle:thin:@localhost:1521:xe";
		String db_id = "service";
		String db_pw = "12345";
		
		Connection conn = DriverManager.getConnection(db_url, db_id, db_pw);
		
		if(conn != null){
			System.out.println("DB 연결성공!");
		}else {
			System.out.println("DB 연결실패");		
		}
		
		// 사용하고 싶은 SQL문장 작성 및 SQL문장 실행
		// SQL문장을 완성시키고 실행할 수 있는 객체 필요
		// -> PreparedStatement 객체 -> Connection객체를 통해 받아옴
		String sql = "SELECT * FROM WEBMEMBER WHERE ID = ? AND PW = ?";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, id);
		psmt.setString(2, pw);

		ResultSet rs = psmt.executeQuery();
		
		if(rs.next()) {
			System.out.println("로그인 성공!");
			response.sendRedirect("main.jsp?id="+id);
		}else {
			System.out.println("로그인 실패");			
			response.sendRedirect("login.jsp");
		}
	
		// DB와 연결된 객체의 연결을 역순으로 끊기
		if(rs != null){
			rs.close();
		}
		if(psmt != null){
			psmt.close();
		}
		if(conn != null){
			conn.close();
		}
		
	%>

</body>
</html>