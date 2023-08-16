package com.office.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Ex07Select")
public class Ex07Select extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// post 방식으로 넘어온 사람들의 이름중
		// 랜덤으로 한명을 뽑아 웹페이지에 출력하시오
		Random rd = new Random();
		response.setContentType("text/html; charset=UTF-8");
		
		String[] name = request.getParameterValues("name");
		PrintWriter out = response.getWriter();
		
		out.print("<html>");
		out.print("<body>");
		out.printf("오늘은 너가쏴라 ~ %s", name[rd.nextInt(name.length)]);
		out.print("</body>");
		out.print("</html>");

	}

}
