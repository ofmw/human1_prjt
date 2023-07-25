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
//회원관리시스템 관련 요청에 대해 처리하는 컨트롤러.
//사용자의 요청에 views의 member폴더가 경로에 포함되어 전달되므로
//중복된 경로를 컨트롤러 상단에 @RequestMapping("/member")로 처리함
//컨트롤러 내에 정의되는 요청매핑은 모두 앞에 /member가 붙는 것으로 
//보면 됨
	
	@Setter(onMethod_={ @Autowired })
	MemberService mJoin;
	
	//요청처리를 위한 메소드
	
//	@Autowired
//	public void setMJoin(@Qualifier("mJoin") MemberService mJoin) {
//		this.mJoin = mJoin;
//	}
//	
//	@Autowired
//	public void setMCheckId(@Qualifier("mCheckId") MemberService mCheckId) {
//		this.mCheckId = mCheckId;
//	}
//	
//	@Autowired
//	public void setMLogin(@Qualifier("mLogin") MemberService mLogin) {
//		this.mLogin = mLogin;
//	}
//	
//	@Autowired
//	public void setMUpdate(@Qualifier("mUpdate") MemberService mUpdate) {
//		this.mUpdate = mUpdate;
//	}
//	
//	@Autowired
//	public void setMCancel(@Qualifier("mCancel") MemberService mCancel) {
//		this.mCancel = mCancel;
//	}
	
	
	@GetMapping("/join.do")
	public String join() {
		return "member/join";
	}
	
	
	@PostMapping("/join_process.do")
	public String join_process(MemberVo memberVo) {
	//커맨드 객체: 폼의 입력값 전송을 처리하는 메소드에서 파라미터 값들을 저장하는데 사용되는 자바 객체
	//-파라미터 값들을 전달받을 수있도록 setter메소드를 포함하고 있음
	//-폼의 name 속성값과 일치하는 필드에 입력값을 저장함
	//-뷰에서 커맨드 객체를 사용하려면 첫글자를 소문자로 바꾼 클래스 이름으로 사용할 수 있음
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
