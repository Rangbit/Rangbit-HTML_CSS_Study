package com.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.board.entity.Member;
import com.board.mapper.MemberMapper;

@Controller
public class MemberController {

	@Autowired
	private MemberMapper memberMapper;
	
	// 회원가입 폼으로 이동
	@RequestMapping("/joinForm.do")
	public String joinForm() {
		return "member/joinForm";
	}
	
	// 아이디 중복체크
	@GetMapping("/registerCheck.do")
	public @ResponseBody int RegisterCheck(@RequestParam("memId") String memId) {
		
		Member member = memberMapper.registerCheck(memId);
		
		if(member != null) {
			return 0;
		}else {
			return 1;
		}
	}
	
}
