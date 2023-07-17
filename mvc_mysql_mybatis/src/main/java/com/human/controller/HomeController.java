package com.human.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

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
	
}
