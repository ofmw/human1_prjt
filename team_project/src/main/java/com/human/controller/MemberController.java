package com.human.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.human.service.member.MemberService;
import com.human.vo.MemberVo;

import lombok.Setter;

@Controller
@RequestMapping("/member")
public class MemberController {
	
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
		if(result == 1) {//정상적으로 회원가입이 이루어진 경우
			viewPage = "redirect:/home.do";
			//view이름으로 "redirect:요청정보"가 전달되면 요청정보로 재요청이 이루어짐
		}
		
		return viewPage;
	}
	
	
	
	
}
