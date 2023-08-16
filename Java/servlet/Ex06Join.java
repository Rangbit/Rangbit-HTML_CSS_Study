package com.office.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Ex06Join")
public class Ex06Join extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 회원가입에 작성한 데이터를 콘솔에 출력하기
		
		request.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String nick = request.getParameter("nick");
		String gender = request.getParameter("gender");
		// 동일한 name으로 여러개의 값을 가져오는 방법
		String[] hobby = request.getParameterValues("hobby");
		
		
		System.out.println(id);
		System.out.println(pw);
		System.out.println(nick);
		System.out.println(gender);
		for(int i = 0; i < hobby.length; i++) {
			System.out.println(hobby[i]);			
		}
		
		
	}

}
