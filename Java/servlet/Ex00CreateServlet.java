package com.office.servlet;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


// annotation : 기능이 있는 주석 
// url mapping 방법
// 1. @WebServlet : url mapping 역할 수행
// 2. web.xml 추가

// 자주 볼 에러
// 1. 500 : 코드에러
// 2. 404 : 경로에러

@WebServlet("/FirstServlet")
public class Ex00CreateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	// java - 모든 데이터들을 바이트 형태로 입출력(stream - 통로) 
	// 입력 : 객체 -> 바이트배열 변환(직렬화)
	// 출력 : 바이트배열 -> 객체 (역직렬화)
       
	
	// 생성자 : 객체 생성( 자바객체)
    public Ex00CreateServlet() {
        super();
    }

    // 1. 처음에 딱 한번 호출, 초기값 설정 메소드
    // 서블릿 객체를 생성하고 초기화 하는 작업
	public void init(ServletConfig config) throws ServletException {
		System.out.println("init call");
	}

	
	// 5. 서블릿 종료시 마지막으로 딱 한번만 호출 됨
	public void destroy() {
		System.out.println("destroy call");
	}

	
	// 2. 브라우저(클라이언트)의 요청을 처리, 로직을 쓰는 구간
	// - 요청방식에 따라서 doGet()/ doPost() 호출할건지 결정
	// - 어떤 요청방식이느냐에 상관없이 똑같이 처리하고 싶을 때 오버라이딩 할 필요없이 service에서 처리가능
	
	// request : http(Web에서 사용하는 Protocol) 요청정보를 제공
	// response : http 응답정보를 제공
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("service call");
		doGet(request, response);
		doPost(request, response);
	}

	// 3. 브라우저(클라이언트)가 get 방식으로 요청했을 경우 service메소드로부터 호출됨 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 System.out.println("doGet call");
	}

	// 4. 브라우저(클라이언트)가 Post 방식으로 요청했을 경우 service메소드로부터 호출됨 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost call");
	}

}
