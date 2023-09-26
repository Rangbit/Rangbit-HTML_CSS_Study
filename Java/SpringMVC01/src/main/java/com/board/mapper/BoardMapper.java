package com.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.board.entity.Board;


@Mapper
public interface BoardMapper {

	public List<Board> boardSelectList();

	public void boardInsert(Board board);

	public Board boardContent(int num);

	public void boardDelete(int num);

}

