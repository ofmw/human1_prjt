package com.omart.controller;

import java.util.List;

import javax.script.ScriptException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.omart.service.member.MemberService;
import com.omart.service.naver.NaverService;
import com.omart.vo.MemberVo;

import lombok.Setter;

@Controller
@RequestMapping("/")
public class NaverController {
	
	@Setter(onMethod_={ @Autowired })
	private NaverService nToken, nCancel;
	@Setter(onMethod_={ @Autowired })
	private MemberService mWish;
	
	//카카오 회원가입 및 로그인
	@GetMapping("/naverlogin.do")
	public String kakaoLogin(HttpSession session, HttpServletRequest request) throws ScriptException {
		
		String code = request.getParameter("code");

		if (code != null) {
			
			System.out.println("네이버로그인 메서드 실행");
	
			MemberVo userInfo = new MemberVo();
		    String access_token = null;
		    
		    access_token = nToken.getNaverAccessToken(code);
	        userInfo = nToken.getNaverUserInfo(access_token);
	        String platform = userInfo.getPlatform();
		    
		    if (userInfo.getPlatform().equals("naver")) {
		    
		    	// code는 네이버 서버로부터 받은 인가 코드
			    System.out.println("━━━━━━━━━━━━━━━━━<네이버 로그인 요청>━━━━━━━━━━━━━━━━━");
			    System.out.println("인가 코드: " + code);
			    
		        
		        List<String> wishList = mWish.getWishList(userInfo.getM_idx());
		        System.out.println("네이버 유저 m_idx: " +userInfo.getM_idx());
		        
		        session.setAttribute("access_token", access_token);
		        session.setAttribute("member", userInfo);
		        session.setAttribute("wishList", wishList);
		        
		        // 출력
			    System.out.println("가입된 회원 이름 : " + userInfo.getM_name());
			    System.out.println("가입된 회원 이메일(id) : " + userInfo.getM_id());
			    System.out.println("가입된 회원 성별 : " + userInfo.getGender());
	
		    	return "redirect:/index.do";
	        } else {
	        	System.out.println("기존 가입 플랫폼 존재: " +platform);
	        	
	        	int unlink_result = nCancel.naverUnlink(access_token);
	        	if (unlink_result == 1) {
	        		System.out.println("네이버 계정에서 사이트 연결 해제");
	        		return "redirect:/member/checkMember.do?platform="+platform;
	        	} else {
	        		System.out.println("네이버 계정에서 사이트 연결 해제 실패");
	        		return "redirect:/index.do";
	        	}
	        }
	    
		} else {
			return "redirect:/";
		}
		
	}
	
	//네이버 로그아웃
	@GetMapping("/**/naverlogout.do")
	public String kakaoLogout(HttpSession session) {
		System.out.println("━━━━━━━━━━━━━━━━━<네이버 로그아웃 요청>━━━━━━━━━━━━━━━━━");
	
		return "redirect:/logout.do";
	}
	
}