package com.office.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Ex01Print")
public class Ex01Print extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 서버 -> 클라이언트에게 응답
		// PrintWriter : 텍스트 출력 스트림(통로)
		PrintWriter out =  response.getWriter();
		
		// html파일 한글문서같이 텍스트 형태(문자열)
//		out.print("<html><body>"
//				+ "<h1>Hello World<h1>"
//				+ "</body></html>");
		out.print("<html>");
		out.print("<body>");
		out.print("<h1>Hello World<h1>");
		out.print("</body>");
		out.print("</html>");	
//		C:-----\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps
//		  \Servlet\WEB-INF\classes\com\office\servlet
	}

}
