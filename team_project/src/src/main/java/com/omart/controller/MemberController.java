package com.omart.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.omart.service.member.MemberService;
import com.omart.vo.MemberVo;

import lombok.Setter;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Setter(onMethod_={ @Autowired })
	private MemberService mJoin, mWish;
	
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
			
			// 가입 성공시 생성된 해당 회원의 m_idx 조회
			int m_idx = mJoin.checkM_idx(memberVo);
			mWish.insertWish(m_idx);
			viewPage = "redirect:/index.do";
		}
		return viewPage;
	}
	
	@PostMapping("/checkId")
	@CrossOrigin(origins = "http://localhost:9090")
	@ResponseBody
	public String checkId(@RequestParam("m_id") String m_id) {
		boolean isDuplicate = mJoin.checkDuplicateId(m_id);
		if(isDuplicate) {
			return "DUPLICATE";
		} else {
			return "AVAILABLE";
		}
	}
	 
	 
	//로그아웃
//	@GetMapping("/logout.do")
//	public String logout(HttpServletRequest request) {
//		
//		HttpSession session = request.getSession();
//		session.invalidate();
//		
//		return "member/logout";
//	}
}
