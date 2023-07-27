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

		return "boardFile/list_notice_write";/* 뷰의 이름 */
	}
	
	@GetMapping("boardFile/list_inquiry")
	public String home2() {

		return "boardFile/list_inquiry";/* 뷰의 이름 */
	}
	
}
