package com.omart.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.omart.service.member.MemberService;
import com.omart.vo.MemberVo;

import lombok.Setter;

@Controller
@RequestMapping("/member")
public class MemberController {

//회원관리시스템 관련 요청에 대해 처리하는 컨트롤러.
//사용자의 요청에 views의 member폴더가 경로에 포함되어 전달되므로
//중복된 경로를 컨트롤러 상단에 @RequestMapping("/member")로 처리함
//컨트롤러 내에 정의되는 요청매핑은 모두 앞에 /member가 붙는 것으로 
//보면 됨
	
	@Setter(onMethod_={ @Autowired })
	MemberService mJoin;
	
	@GetMapping("/join.do")
	public String join() {
		return "member/join";
	}	
	
	@PostMapping("/join_process.do")
	public String join_process(MemberVo memberVo) {
	

		System.out.println("join_process");
		int result = mJoin.join(memberVo);
		
		String viewPage="member/join";
		if(result == 1) {
			viewPage = "redirect:/home.do";
		}
		return viewPage;
	}
		
	//로그아웃
	@GetMapping("/logout.do")
	public String logout(HttpServletRequest request) {
		
		String viewPage = "redirect:/index.do";
		HttpSession session = request.getSession();
		session.invalidate();
		
		return viewPage;
	}
}
