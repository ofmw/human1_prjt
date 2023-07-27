package com.omart.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	//마이페이지
	@GetMapping("/mypage.do")
	public String mypage() {
		return "mypage/mypage";
	}
	
	//마이페이지 - 주문/배송조회
	@GetMapping("/purchase_history.do")
	public String purchase_history() {
		return "mypage/purchase_history";
	}
	
	//마이페이지 - 주문상세조회
	@GetMapping("/order_detail.do")
	public String order_detail() {
		return "mypage/order_detail";
	}
	
	//마이페이지 -> 1:1문의
	@GetMapping("/list_inquiry.do")
	public String list_inquiry() {
		return "redirect:/boardFile/list_inquiry.do";
	}
	
	//마이페이지 -> 공지사항
	@GetMapping("/list_notice.do")
	public String list_notice() {
		return "redirect:/boardFile/list_notice.do";
	}
	
	//로그아웃
	@GetMapping("member/logout.do")
	public String logout(HttpServletRequest request) {
		
		String viewPage = "redirect:/index.do";
		HttpSession session = request.getSession();
		session.invalidate();
		
		return viewPage;
	}
}
