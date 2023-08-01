package com.omart.controller;

import javax.script.ScriptException;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.omart.service.kakao.KakaoService;
import com.omart.vo.MemberVo;

import lombok.Setter;

@Controller
@RequestMapping("/")
public class KakaoController {
	
	@Setter(onMethod_={ @Autowired })
	private KakaoService kToken;
	
	//카카오 회원가입 및 로그인
	@GetMapping("/kakaologin.do")
	public String kakaoLogin(@RequestParam("code") String code, HttpSession session) throws ScriptException {
		
		

	    // userInfo가 null이 아닐 때만 다시 access_Token을 가져오는 로직을 실행
	    MemberVo userInfo = (MemberVo) session.getAttribute("member");
	    String access_Token = null;
	    if (userInfo == null) {
	    	
	    	// code는 카카오 서버로부터 받은 인가 코드
		    System.out.println("━━━━━━━━━━━━━━━━━<카카오 로그인 요청>━━━━━━━━━━━━━━━━━");
		    System.out.println("인가 코드: " + code);
		    
	        access_Token = kToken.getKakaoAccessToken(code);
	        userInfo = kToken.getKakaoUserInfo(access_Token);
	        session.setAttribute("access_token", access_Token);
	        session.setAttribute("member", userInfo);
	        
	        // 출력
		    System.out.println("가입된 회원 이름 : " + userInfo.getM_name());
		    System.out.println("가입된 회원 이메일(id) : " + userInfo.getM_id());
		    System.out.println("가입된 회원 성별 : " + userInfo.getGender());
	    }

	    return "redirect:/index.do";
		
	}
	
	//카카오 로그아웃
	@GetMapping("/kakaologout.do")
	public String kakaoLogout(HttpSession session) {
		System.out.println("━━━━━━━━━━━━━━━━━<카카오 로그아웃 요청>━━━━━━━━━━━━━━━━━");
		System.out.println("access_token: " +session.getAttribute("access_token"));
		kToken.kakaoLogout((String)session.getAttribute("access_token"));
		session.invalidate();
		return "redirect:/index.do";
	}
	
}