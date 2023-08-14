package com.omart.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.omart.service.kakao.KakaoService;
import com.omart.service.member.MemberService;
import com.omart.vo.MemberVo;

import lombok.Setter;

@RestController
public class AjaxMemberController {
	
	@Setter(onMethod_={ @Autowired })
	private MemberService mLogin, mCancel, mWish;
	@Setter(onMethod_={ @Autowired })
	private KakaoService kCancel;

	//로그인
	@PostMapping("/**/login.do")
    public String login(@RequestParam("m_id") String m_id,
                        @RequestParam("m_pw") String m_pw,
                        HttpSession session) {
		

		System.out.println("━━━━━━━━━━━━━━━━━<일반 로그인 요청>━━━━━━━━━━━━━━━━━");
		
		MemberVo vo = mLogin.login(m_id, m_pw);
		
		if(vo != null){
			
			int m_idx = vo.getM_idx();
			
			List<String> wishList = mWish.getWishList(m_idx);

			System.out.println(wishList);
			
			String grade = null;
			switch(vo.getGrade()) {
			case 0: grade = "브론즈"; break;
			case 1: grade = "실버"; break;
			case 2: grade = "골드"; break;
			}
			
			System.out.println("로그인 결과 : 성공");
			System.out.println("----------회원 개인정보----------");
			System.out.println("이름: " +vo.getM_name());
			System.out.println("성별: " +((vo.getGender() == 1 || vo.getGender() == 3) ? "남자":"여자"));
			System.out.println("전화번호: " +vo.getSelNum());
			System.out.println("회원번호: " +vo.getM_idx());
			System.out.println("생년월일: " +vo.getBirth());
			System.out.println("----------회원 계정정보----------");
			System.out.println("아이디: " +vo.getM_id());
			System.out.println("비밀번호 (암호화): " +vo.getM_pw());
			System.out.println("비밀번호 (복호화): " +m_pw);
			System.out.println("가입일: " +vo.getJ_date());
			System.out.println("활성여부: " +vo.getA_state());
//			System.out.println("플랫폼: " +vo.getPlatform());
			System.out.println("회원등급: " + grade);
			
			session.setAttribute("member", vo);
			session.setAttribute("wishList", wishList);
			
			mLogin.recordLogin(m_idx);
						
			if(vo.getGrade() == 9 || vo.getGrade() == 8 || vo.getGrade() == 7) {
				session.setMaxInactiveInterval(60 * 60);
				long startTime = System.currentTimeMillis();
				session.setAttribute("startTime", startTime);
			}else {
				session.setMaxInactiveInterval(-1);
			}
			
            return "success";
        } else {
        	System.out.println("로그인 결과 : 실패(해당 계정 정보 없음)");
            return "failure";
        }
    }
	
	
	//회원탈퇴
		@PostMapping("/mypage/omartCancel.do")
		public String omartCancel(HttpSession session) {
			System.out.println("━━━━━━━━━━━━━━━━━<일반 회원탈퇴 요청>━━━━━━━━━━━━━━━━━");
			
			MemberVo vo = (MemberVo) session.getAttribute("member");
			int m_idx = vo.getM_idx();
			System.out.println("m_idx: " +m_idx);
			
			int result = mCancel.cancel(m_idx);
			
			if (result != 0) {
				
				session.invalidate();
				System.out.println("회원탈퇴 성공");
				return "success";
			} else {
				System.out.println("회원탈퇴 실패");
				return "fail";
			}
			
		}
		
		//카카오 회원탈퇴
		@PostMapping("/mypage/kakaoCancel.do")
		public String kakaoCancel(HttpSession session) {
			System.out.println("━━━━━━━━━━━━━━━━━<카카오 회원탈퇴 요청>━━━━━━━━━━━━━━━━━");
			
			String access_token = (String) session.getAttribute("access_token");
			MemberVo vo = (MemberVo) session.getAttribute("member");
			int m_idx = vo.getM_idx();
			System.out.println("access_token: " +access_token);
			System.out.println("m_idx: " +m_idx);
			
			int result = kCancel.kakaoCancel(access_token, m_idx);
			
			if (result != 0) {
				
				session.invalidate();
				System.out.println("회원탈퇴 성공");
				return "success";
			} else {
				System.out.println("회원탈퇴 실패");
				return "fail";
			}
			
		}

}
