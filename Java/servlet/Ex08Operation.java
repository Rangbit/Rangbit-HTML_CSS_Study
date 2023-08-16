package com.office.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Ex08Operation")
public class Ex08Operation extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int num1 = Integer.parseInt(request.getParameter("num1"));
		int num2 = Integer.parseInt(request.getParameter("num2"));		
		String op = request.getParameter("op");
		int sum = 0;
		
		if(op.equals("+")) {
			sum = num1+num2;
		}else if(op.equals("-")) {
			sum = num1-num2;
		}else if(op.equals("*")) {
			sum = num1*num2;
		}else if(op.equals("/")) {
			sum = num1/num2;
		}
		
		PrintWriter out = response.getWriter();
		out.print("<html>");
		out.print("<body>");
		out.printf("%d %s %d = %d", num1,op,num2,sum);		
		out.print("</body>");
		out.print("</html>");	
		
	}

}
