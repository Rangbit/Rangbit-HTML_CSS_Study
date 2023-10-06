package com.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.board.entity.Board;
import com.board.mapper.BoardMapper;


// Restcon -> 비동기 통신만 가능
// Data, 객체를 return
// 페이지 이동 불가

@RestController
@RequestMapping("/board")
public class BoardRestController {

	
	@Autowired
	private BoardMapper boardMapper;

	// 게시글 전체조회  /boardSelectList.do
	//  -> 비동기방식으로 요청이되어서 사용하는것이기 때문에 무조건 명시해줘야 함
	//					데이터를 JSON형태로 뿌려줌
	//					RestController에서는 사용하지 않음(@ResponseBody)
	@GetMapping("/all")
	public List<Board> boardSelectList() {
		System.out.println("[게시글 전체조회]");
		List<Board> list = boardMapper.boardSelectList();
		return list;
	}
	
	// 게시글 등록하기
	@PostMapping("/new")
	public void boardInsert(Board board) {
		boardMapper.boardInsert(board);
		System.out.println("[게시글 등록 성공]");
	}
	
	// 게시글 삭제하기
	@DeleteMapping("/{idx}")
	public void boardDelete(@PathVariable("idx") int idx) {
		boardMapper.boardDelete(idx);
		System.out.println("[게시글 삭제 성공]");
	}
	
	// 조회수 올리기
	@PutMapping("/count/{idx}")
	public void boardCount(@PathVariable("idx") int idx) {
		boardMapper.boardCount(idx);
	}
	
	// 게시글 수정하기
	@PutMapping("/update")
	public void boardUpdateWrite(@RequestBody Board board) {
		boardMapper.boardUpdateWrite(board);
	}
	
	// 게시글 상세보기
	// @PathVariable name값이 없어서 값을 딱하나만 가져와서 받는다
	@GetMapping("/{idx}")
	public Board boardContent(@PathVariable("idx")  int idx) {
		Board board = boardMapper.boardContent(idx);
		return board;
	}
	
}
