package com.board.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.board.entity.Member;

@Mapper
public interface MemberMapper {

	public Member registerCheck(String memId);

	public int join(Member member);

	public Member login(Member member);

	public int update(Member member);

	public int updateImage(Member mvo);

}

