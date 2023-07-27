package com.omart.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@GetMapping("/")
	public String home() {
		return "index";/* 뷰의 이름 */
	}
	@GetMapping("/index.do")
	public String index() {
		return "index";/* 뷰의 이름 */
	}
	@GetMapping("/mypage/index.do")
	public String mypage_index() {
		return "index";/* 뷰의 이름 */
	}
}
