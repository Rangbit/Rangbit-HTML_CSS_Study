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

import com.board.entity.Board;
import com.board.mapper.BoardMapper;

// Handler(Controller-POJO) Mapping이 Controller를 찾기위해 @Controller로 명시해야 함
@Controller
public class BoardController {
	
	@Autowired
	private BoardMapper boardMapper;

	// 게시글 전체조회  /boardSelectList.do
	@GetMapping("/boardSelectList.do")
	public String boardSelectList(Model model) {
		System.out.println("[게시글 전체조회]");
		// DB로부터 게시글 정보를 불러오기
		// 번호, 제목, 내용, 작성자, 작성일, 조회수
		// 하나의 게시글 작성

		
//		model.addAttribute("vo1", vo1);
		List<Board> list = boardMapper.boardSelectList();
		
		// vo1, vo2, vo3를 jsp로 보낼건데 -> request가 아닌 좀더 작은영역인 model을 사용
		// 객체바인딩(동적바인딩)
		model.addAttribute("list", list);
		return "boardList";
	}
	
	// 게시글 작성하는 jsp로 이동 /boardForm.do
	@GetMapping("/boardForm.do")
	public String boardForm() {
		return "boardForm";
	}
	
	// 게시글 작성  /boardInsert.do
	@PostMapping("/boardInsert.do")
	public String boardInsert(Board board) { // title, content, writer
		System.out.println(board.toString());
		boardMapper.boardInsert(board);
		// sendRedirect 방식으로 요청 URL 알려주기
		
		return "redirect:/boardSelectList.do";
	}
	
	// 게시글 상세보기  /boardContent.do
	@GetMapping("/boardContent.do")  // boardContent.do?idx=5
	public String boardContent(@RequestParam("idx") int num, Model model) {
		// 조회수 올리기
		boardMapper.boardCount(num);
		// boardMapper 사용해서 Board에 담고제목을 입력하세요
		Board convo = boardMapper.boardContent(num);
		// model 영역에 저장 후
		model.addAttribute("convo", convo);
		// boardContent.jsp 로 이동
		return "boardContent";
	}
	
	// 게시글 삭제  /boardDelete.do
	@GetMapping("/boardDelete.do")  // boardContent.do?idx=5
	public String boardDelete(@RequestParam("idx") int num) {
		// boardMapper 사용해서 Board에 담고
		boardMapper.boardDelete(num);
		return "redirect:/boardSelectList.do";
	}
	
	// 게시글 수정페이지 이동  /boardUpdate.do
	@GetMapping("/boardUpdate.do/{idx}")  // boardContent.do?idx=5
	public String boardUpdate(@PathVariable("idx") int idx, Model model) {
		// boardMapper 사용해서 Board에 담고
		Board convo = boardMapper.boardContent(idx);
		model.addAttribute("convo", convo);
		return "boardUpdate";
	}
	
	// 게시글 수정  /boardUpdate.do
	@PostMapping("/boardUpdateWrite.do")  // boardContent.do?idx=5
	public String boardUpdateWrite(Board board) {
		// boardMapper 사용해서 Board에 담고
		System.out.println(board.toString());
		boardMapper.boardUpdateWrite(board);
		return "redirect:/boardSelectList.do";
	}
	
}
