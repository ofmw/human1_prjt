package com.omart.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	//로그아웃
	@GetMapping("/logout.do")
	public String logout(HttpServletRequest request) {
		
		String viewPage = "redirect:/index.do";
		HttpSession session = request.getSession();
		session.invalidate();
		
		return viewPage;
	}
}
