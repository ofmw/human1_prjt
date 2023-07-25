package com.omart.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
//	@Setter(onMethod_={ @Autowired })
//	MemberService mJoin;
	
	@GetMapping("/member.do")
	public String member() {
		return "redirect:/admin.do?status=member";
	}	
		
}
