package com.board.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.board.entity.Member;

@Mapper
public interface MemberMapper {

	public Member registerCheck(String memId);

}

