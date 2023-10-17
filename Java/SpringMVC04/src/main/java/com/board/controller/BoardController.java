package com.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.board.mapper.BoardMapper;

// Handler(Controller-POJO) Mapping이 Controller를 찾기위해 @Controller로 명시해야 함
@Controller
public class BoardController {

	@Autowired
	private BoardMapper boardMapper;
	
	// index.jsp로 이동하는 동기방식 메소드
	@RequestMapping("/boardMain.do")
	public String index() {
		return "board/index";
	}
	
	
}
