package com.office.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Ex02DataSend")
public class Ex02DataSend extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 1. 요청데이터 가져오기
		// 요청데이터를 다루기 때문에 request 객체 사용
		
		String data = request.getParameter("data");
		System.out.println(data);
		
		// 2. 사용자가 입력한 값을 화면에 출력하기
		// PrintWriter : 텍스트 출력 스트림
		PrintWriter out = response.getWriter();
		
		out.print("<html>");
		out.print("<body>");
		out.print(data);
		out.print("</body>");
		out.print("</html>");	
	
	}

}
