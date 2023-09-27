package com.board.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.board.entity.Board;
import com.board.mapper.BoardMapper;

// Handler(Controller-POJO) Mapping이 Controller를 찾기위해 @Controller로 명시해야 함
@Controller
public class BoardController {
	
	@Autowired
	private BoardMapper boardMapper;

	
	// index.jsp로 이동하는 동기방식 메소드
	@RequestMapping("/")
	public String index() {
		return "index";
	}
	
	// 게시글 전체조회  /boardSelectList.do
	// @ResponseBody -> 비동기방식으로 요청이되어서 사용하는것이기 때문에 무조건 명시해줘야 함
	//					데이터를 JSON형태로 뿌려줌
	@RequestMapping("/boardSelectList.do")
	public @ResponseBody List<Board> boardSelectList() {
		System.out.println("[게시글 전체조회]");
		List<Board> list = boardMapper.boardSelectList();
		return list;
	}
	
	
}
