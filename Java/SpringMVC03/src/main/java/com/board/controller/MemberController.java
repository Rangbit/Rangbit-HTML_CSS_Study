package com.board.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.board.entity.Member;
import com.board.mapper.MemberMapper;

@Controller
public class MemberController {

	@Autowired
	private MemberMapper memberMapper;
	
	// 회원가입 기능
	@PostMapping("/join.do")
	public String join(Member member, HttpSession session, RedirectAttributes rttr) {
		System.out.println(member.toString());
		
		// RedirectAttributes
		// - redirect 방식으로 페이지 이동을 하는데, 저장해야할 정보가 있을 때
		// request(model) 없어지고, session을 사용하기에는 비효율적
		// 딱 한번만 데이터를 저장해서 다음페이지에 뿌려줌
		
		
		if(member.getMemId() == null || 
		   member.getMemId().equals("") || 
		   member.getMemPw() == null ||
		   member.getMemPw().equals("") ||
		   member.getMemName() == null ||
		   member.getMemName().equals("") ||
		   member.getMemAge() < 0 ||
		   member.getMemEmail() == null ||
		   member.getMemEmail().equals("")){
			// 회원가입 실패
			// "모든 정보를 입력해주세요."
			rttr.addFlashAttribute("msgType","실패 메세지");
			rttr.addFlashAttribute("msg","모든정보를 입력해주세요");
			return "redirect:/joinForm.do";			
		}else {
			int cnt = memberMapper.join(member);
			if(cnt == 1) {
				// 회원가입 성공
				// 로그인 상태로 변경
				// "회원가입에 성공했습니다."
				rttr.addFlashAttribute("msgType","성공 메세지");
				rttr.addFlashAttribute("msg","회원가입을 축하합니다!");
				session.setAttribute("mvo", member);
				return "redirect:/";
			}else {
				// 회원가입 실패
				rttr.addFlashAttribute("msgType","실패 메세지");
				rttr.addFlashAttribute("msg","회원가입에 실패했습니다.");
				return "redirect:/joinForm.do";
			}
		}
	}
	
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
