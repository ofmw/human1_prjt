package com.omart.controller;

import javax.script.ScriptException;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.omart.service.member.KakaoService;
import com.omart.service.member.MemberService;
import com.omart.vo.KakaoVo;

import lombok.Setter;

@Controller
@RequestMapping("/")
public class KakaoController {
	
	@Setter(onMethod_={ @Autowired })
	KakaoService ks;
	@Setter(onMethod_={ @Autowired })
	MemberService kLogin;
	

	@GetMapping("/kakao.do")
	public String kakaoLogin(@RequestParam("code") String code, HttpSession session) throws ScriptException {
		// code는 카카오 서버로부터 받은 인가 코드
		System.out.println("@@@@@@@@토큰토큰: " + code);
		String access_Token = ks.getAccessToken(code);
		
		// 위에서 만든 코드 아래에 코드 추가
		KakaoVo userInfo = ks.getUserInfo(access_Token);
		System.out.println("###access_Token#### : " + access_Token);
		System.out.println("###nickname#### : " + userInfo.getM_name());
		System.out.println("###email#### : " + userInfo.getM_id());
		
		
		
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
	
	@GetMapping("/klogout.do")
	public String klogout(HttpSession session) {
		System.out.println("access_tooooooooken" +session.getAttribute("access_token"));
		ks.logout((String)session.getAttribute("access_token"));
		session.invalidate();
		return "redirect:/index.do";
	}
	
}