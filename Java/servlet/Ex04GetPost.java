package com.office.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Ex04GetPost")
public class Ex04GetPost extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// post 데이터 인코딩
		request.setCharacterEncoding("UTF-8");
		
		// 데이터 가져오기
		String name = request.getParameter("name");
		System.out.println(name);
		
		// 페이지 인코딩
		response.setContentType("text/html; charset=UTF-8");
		
		// 요청방식 확인
		String method = request.getMethod();
		System.out.println("요청방식 : " + method);
		
		PrintWriter out = response.getWriter();
		
		out.print("<html>");
		out.print("<body>");
		out.printf("%s님 환영합니다.", name);
		out.print("</body>");
		out.print("</html>");	
		
		
	}

}
