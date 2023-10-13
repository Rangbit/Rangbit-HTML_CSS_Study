package com.board.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
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
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Controller
public class MemberController {

	@Autowired
	private MemberMapper memberMapper;

	// 파일 업로드 기능 -> cos.jar -> MultipartRequest객체 사용
	@PostMapping("/imageUpdate.do")
	public String imageUpdate(HttpServletRequest request, HttpSession session, RedirectAttributes rttr) {

		MultipartRequest multi = null;

		// MultipartRequest 객체를 생성하기위한 매개변수 5가지
		// 1. request 객체
		// 2. 사진저장경로
		// 3. 허용 가능 사이즈
		// 4. 파일에 대한 인코딩
		// 5. 파일이름 중복제거
		String savePath = request.getSession().getServletContext().getRealPath("resources/profile");
		System.out.println("savePath : " + savePath);
		int maxSize = 1024 * 1024 * 100; // 10MB
		String encoding = "UTF-8";
		DefaultFileRenamePolicy rename = new DefaultFileRenamePolicy();

		// 기존에 가지고 있는 해당 프로필사진 삭제
		// -> memId가 필요 -> memId에 해당하는 memProfile을 가직오기 위해서
		String memId = ((Member) session.getAttribute("mvo")).getMemId();
		
		try {
			multi = new MultipartRequest(request, savePath, maxSize, encoding, rename);
		} catch (IOException e) {
			rttr.addFlashAttribute("msgType", "실패 메세지");
			rttr.addFlashAttribute("msg", "파일 크기는 100MB를 넘을 수 없습니다.");
			return "redirect:/imageForm.do";
		}

		// 이미지 파일인지 판별하기
		// 내가보낸 파일가져오기
		File file = multi.getFile("memProfile");
		if (file != null) {

			System.out.println(file.getName());
			String fileType = file.getName().substring(file.getName().lastIndexOf(".") + 1);
			System.out.println(fileType);

			// 확장자 -> 소문자로 바꾸기
			fileType = fileType.toLowerCase();

			if (!(fileType.equals("jpg") || fileType.equals("png") || fileType.equals("gif") || fileType.equals("jpeg")
					|| fileType.equals("apng"))) {
				file.delete();
				rttr.addFlashAttribute("msgType", "실패 메세지");
				rttr.addFlashAttribute("msg", "이미지파일을 등록해주세요");
			} else {
				String oldImg = memberMapper.registerCheck(memId).getMemProfile(); // memId 의 Member객체 가져오기
				File oldFile = new File(savePath + "/" + "img.jpg");

				// 존재할 때만 삭제
				if (oldFile.exists()) {
					oldFile.delete();
				}
			}
		}
		// DB에 memProfile값 넣어주기
		String newProfile = multi.getFilesystemName("memProfile");
		Member mvo = new Member();
		mvo.setMemId(memId);
		mvo.setMemProfile(newProfile);
		
		int cnt = memberMapper.updateImage(mvo);
		
		if(cnt == 1) {			
			rttr.addFlashAttribute("msgType", "성공 메세지");
			rttr.addFlashAttribute("msg", "프로필사진 변경 성공");
			return "redirect:/";
		}else {
			rttr.addFlashAttribute("msgType", "실패 메세지");
			rttr.addFlashAttribute("msg", "프로필사진 변경 실패");
			return "redirect:/imageForm.do";			
		}
		
	}

	// 이미지 업데이트 페이지로 이동
	@GetMapping("/imageForm.do")
	public String imageForm() {
		return "member/imageForm";
	}

	// 회원정보 업데이트
	@PostMapping("/update.do")
	public String update(Member member, HttpSession session, RedirectAttributes rttr) {

		if (member.getMemId() == null || member.getMemId().equals("") || member.getMemPw() == null
				|| member.getMemPw().equals("") || member.getMemGender().equals("") || member.getMemName() == null
				|| member.getMemName().equals("") || member.getMemAge() < 0 || member.getMemEmail() == null
				|| member.getMemEmail().equals("")) {
			// 1. 하나라도 누락된 데이터가 있다면 updateForm.jsp로 이동후
			// 모달창에 "모든내용을 입력해주세요"
			rttr.addFlashAttribute("msgType", "실패 메세지");
			rttr.addFlashAttribute("msg", "모든정보를 입력해주세요");
			return "redirect:/updateForm.do";
		} else {
			int cnt = memberMapper.update(member);
			if (cnt == 0) {
				// 2. 회원정보 수정에 실패할 경우 updateForm.jsp로 이동후
				// 모달창에 "회원정보 수정에 실패하셨습니다."
				rttr.addFlashAttribute("msgType", "실패 메세지");
				rttr.addFlashAttribute("msg", "회원가입에 실패했습니다.");
				return "redirect:/updateForm.do";
			} else {
				// 3. 회원정보 수정에 성공할 경우 home.jsp로 이동후
				// 모달창에 "회원정보 수정에 성공하셨습니다."
				rttr.addFlashAttribute("msgType", "성공 메세지");
				rttr.addFlashAttribute("msg", "회원정보 수정에 성공하셨습니다.!");
				session.setAttribute("mvo", member);
				return "redirect:/";

			}
		}
	}

	// 회원정보 수정하는 폼으로 이동
	@GetMapping("/updateForm.do")
	public String updateForm() {
		return "member/updateForm";
	}

	// 로그인 기능
	@PostMapping("/login.do")
	public String login(Member member, HttpSession session, RedirectAttributes rttr) {
		// 입력한 memID와 memPw가 일치하는 회원을 DB에서 가져와서
		Member mvo = memberMapper.login(member);

		if (mvo != null) {
			// 로그인 성공시
			// session에 mvo라는 이름으로 저장 후 -> home.jsp로 이동
			// -> modal창에 "로그인에 성공했습니다."
			rttr.addFlashAttribute("msgType", "로그인성공");
			rttr.addFlashAttribute("msg", member.getMemId() + "님 환영합니다!");
			session.setAttribute("mvo", mvo);
			return "redirect:/";
		} else {
			// 로그인 실패시
			// loginForm.jsp로 이동-> modal창에 "다시 로그인해주세요"
			rttr.addFlashAttribute("msgType", "로그인실패");
			rttr.addFlashAttribute("msg", "아이디와 비밀번호를 확인해주세요");
			return "redirect:/loginForm.do";
		}

	}

	// 로그인 폼으로 이동
	@GetMapping("/loginForm.do")
	public String loginForm() {
		return "member/loginForm";
	}

	// 로그아웃 기능
	@GetMapping("/logout.do")
	public String logout(HttpSession session, RedirectAttributes rttr) {

		session.removeAttribute("mvo");
		// session.invalidate();
		rttr.addFlashAttribute("msgType", "로그아웃 메세지");
		rttr.addFlashAttribute("msg", "로그아웃 완료");

		return "redirect:/";
	}

	// 회원가입 기능
	@PostMapping("/join.do")
	public String join(Member member, HttpSession session, RedirectAttributes rttr) {
		System.out.println(member.toString());

		// RedirectAttributes
		// - redirect 방식으로 페이지 이동을 하는데, 저장해야할 정보가 있을 때
		// request(model) 없어지고, session을 사용하기에는 비효율적
		// 딱 한번만 데이터를 저장해서 다음페이지에 뿌려줌

		if (member.getMemId() == null || member.getMemId().equals("") || member.getMemPw() == null
				|| member.getMemPw().equals("") || member.getMemName() == null || member.getMemName().equals("")
				|| member.getMemAge() < 0 || member.getMemEmail() == null || member.getMemEmail().equals("")) {
			// 회원가입 실패
			// "모든 정보를 입력해주세요."
			rttr.addFlashAttribute("msgType", "실패 메세지");
			rttr.addFlashAttribute("msg", "모든정보를 입력해주세요");
			return "redirect:/joinForm.do";
		} else {
			int cnt = memberMapper.join(member);
			if (cnt == 1) {
				// 회원가입 성공
				// 로그인 상태로 변경
				// "회원가입에 성공했습니다."
				rttr.addFlashAttribute("msgType", "성공 메세지");
				rttr.addFlashAttribute("msg", "회원가입을 축하합니다!");
				session.setAttribute("mvo", member);
				return "redirect:/";
			} else {
				// 회원가입 실패
				rttr.addFlashAttribute("msgType", "실패 메세지");
				rttr.addFlashAttribute("msg", "회원가입에 실패했습니다.");
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

		if (member != null) {
			return 0;
		} else {
			return 1;
		}
	}

}
