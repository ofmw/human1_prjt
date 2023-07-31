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
		
		//code는 카카오 서버로부터 받은 인가 코드
		System.out.println("━━━━━━━━━━━━━━━━━<카카오 로그인 요청>━━━━━━━━━━━━━━━━━");
		System.out.println("인가 코드: " + code);
		String access_Token = kToken.getKakaoAccessToken(code);
		
		//위에서 만든 코드 아래에 코드 추가
		MemberVo userInfo = kToken.getKakaoUserInfo(access_Token);
//		System.out.println("###access_Token#### : " + access_Token);
		System.out.println("가입된 회원 이름 : " + userInfo.getM_name());
		System.out.println("가입된 회원 이메일(id) : " + userInfo.getM_id());
		userInfo.setPlatform("kakao");
		
		
		// 위 코드는 session객체에 담긴 정보를 초기화 하는 코드.
		session.setAttribute("access_token", access_Token);
		session.setAttribute("member", userInfo);
		// 위 2개의 코드는 닉네임과 이메일을 session객체에 담는 코드
		// jsp에서 ${sessionScope.kakaoN} 이런 형식으로 사용할 수 있다.
		
//		String member_id = (String) userInfo.get("email");
//		System.out.println("컨트롤러: " +member_id);
//		
//		MemberVo vo = kLogin.klogin(member_id);
//		HttpSession session = request.getSession();
//		session.setAttribute("member", vo);
//		
//		ScriptEngineManager manager = new ScriptEngineManager();
//	    ScriptEngine engine = manager.getEngineByName("javascript");
//	    engine.eval("window.close();");
		
		return "index";
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