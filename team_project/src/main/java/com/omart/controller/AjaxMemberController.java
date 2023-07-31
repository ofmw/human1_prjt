package com.omart.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.omart.service.member.MemberService;
import com.omart.vo.MemberVo;

import lombok.Setter;

@RestController
@RequestMapping("/member")
public class AjaxMemberController {

	@Setter(onMethod_={ @Autowired })
	private MemberService mLogin;
	
	//로그인
	@PostMapping("/login.do")
    public String login(@RequestParam("m_id") String m_id,
                        @RequestParam("m_pw") String m_pw,
                        HttpSession session) {
        
		//로그인 처리를 할 MemberLoginService 클래스를 이용함
		System.out.println("━━━━━━━━━━━━━━━━━<일반 로그인 요청>━━━━━━━━━━━━━━━━━");
		MemberVo vo = mLogin.login(m_id, m_pw);
		
		if(vo != null){
			System.out.println("로그인 결과 : 성공");
			System.out.println("----------회원 개인정보----------");
			System.out.println("이름: " +vo.getM_name());
			System.out.println("성별: " +vo.getGender());
			System.out.println("전화번호: " +vo.getSelNum());
			System.out.println("회원번호: " +vo.getM_idx());
			System.out.println("생년월일: " +vo.getBirth());
			System.out.println("----------회원 계정정보----------");
			System.out.println("아이디: " +vo.getM_id());
			System.out.println("비밀번호: " +vo.getM_pw());
			System.out.println("가입일: " +vo.getJ_date());
			System.out.println("활성여부: " +vo.getA_state());
//			System.out.println("플랫폼: " +vo.getPlatform());
			System.out.println("회원등급: " +vo.getGrade());
			session.setAttribute("member", vo);
            return "success";
        } else {
        	System.out.println("로그인 결과 : 실패(해당 계정 정보 없음)");
            return "failure";
        }
    }
}
