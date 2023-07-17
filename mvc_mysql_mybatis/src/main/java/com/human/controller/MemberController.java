package com.human.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.human.service.member.MemberService;
import com.human.vo.MemberVo;


@Controller
@RequestMapping("/member")
public class MemberController {

	//회원관리시스템 관련 요청에 대해 처리하는 컨트롤러
	//사용자의 요청에 views의 member폴더가 경로에 포함되어 전달되어야 하므로 중복된 경로를 컨트롤러 상단에 @RequestMapping("/member")로 처리함
	//컨트롤러 내에 정의되는 요청매핑은 모두 앞에 /member가 붙게됨
	
	//Controller는 DispatcherServlet으로부터 받은 사용자의 요청을 직접 처리하지 않고 Service클래스로 요청처리를 넘김
	//MemberService인터페이스의 하위클래스로 각 서비스클래스를 정의해줌
	MemberService mJoin, mCheckId, mLogin, mUpdate, mCancel;
	
	@Autowired
	public void setMJoin(@Qualifier("mJoin") MemberService mJoin) {
		this.mJoin = mJoin;
	}
	
	@Autowired
	public void setMCheckId(@Qualifier("mCheckId") MemberService mCheckId) {
		this.mCheckId = mCheckId;
	}
	
	@Autowired
	public void setMLogin(@Qualifier("mLogin") MemberService mLogin) {
		this.mLogin = mLogin;
	}
	
	@Autowired
	public void setMUpdate(@Qualifier("mUpdate") MemberService mUpdate) {
		this.mUpdate = mUpdate;
	}
	
	@Autowired
	public void setMCancel(@Qualifier("mCancel") MemberService mCancel) {
		this.mCancel = mCancel;
	}
	
	@GetMapping("/join.do")
	public String join() {
		return "member/join";
	}
	
	@PostMapping("/join_process.do")
	public String join_process(MemberVo memberVo) {
	//커맨드객체: 폼의 입력값 전송을 처리하는 메소드에서 파라미터 값들을 저장하는데 사용되는 자바객체
	//- 파라미터값들을 전달받을 수 있도록 setter메소드를 포함하고 있음
	//- 폼의 name속성값과 일치하는 필드에 입력값을 저장함
	//- 뷰에서 커맨드객체를 사용하려면 첫글자를 소문자로 바꾼 클래스이름으로 사용할 수 있음
		
		int result = mJoin.join(memberVo);
		
		String viewPage = "member/join";
		if(result == 1) { //회원가입에 성공한 경우
			viewPage = "redirect:/index.do";
			//view이름으로 "redirect:요청정보"가 전달되면 요청정보로 재요청이 이루어짐
		}
		
		return viewPage;
	}
	
	@GetMapping("/checkId.do")
	public String checkId(@RequestParam("member_id") String member_id, Model model) {
	//Get방식으로 전달된 값은 @RequestParam어노테이션을 사용해서 매개변수로 값을 전달받음
		
		model.addAttribute("member_id",member_id);
		return "member/checkId";
	}
	
	@PostMapping("/checkId_process.do")
	public String checkId_process(String member_id, Model model) {
	//폼에서 전달된 값은 @RequestParam어노테이션 없이도 매개변수로 전달받을 수 있음
		
		//사용자의 요청을 처리하기위해 MemberCheckIdService클래스 정의
		int result = mCheckId.checkId(member_id);
		model.addAttribute("result", result);
		model.addAttribute("member_id", member_id);
		
		return "member/checkId";
	}
	
	@GetMapping("/login.do")
	public String login() {
		return "member/login";
	}
	
	@PostMapping("/login_process.do")
	public String login_process(String member_id, String member_pw, HttpServletRequest request, Model model) {
	//폼에서 전달된 값은 @RequestParam어노테이션 없이도 매개변수로 전달받을 수 있음
		
		//로그인처리를 하기위해 MemberLoginService클래스 정의
		MemberVo vo = mLogin.login(member_id, member_pw);
				
		String viewPage = "member/login";
		
		if(vo != null){//로그인 성공시
			//세션객체에 회원 정보를 추가함(추후 사용을 위해 회원정보를 MemberVo객체로 저장함)
			HttpSession session = request.getSession();
			session.setAttribute("member", vo);
			viewPage = "redirect:/index.do";

		}else{//로그인 실패시
			model.addAttribute("msg","fail");
		}
		
		return viewPage;
	}
	
	@GetMapping("/logout.do")
	public String logout(HttpServletRequest request) {
		
		String viewPage = "redirect:/index.do";
		
		HttpSession session = request.getSession();
		session.invalidate();
		
		return viewPage;
	}
	
	//회원정보 수정
	@GetMapping("/update.do")
	public String update() {
		return "member/update";
	}
	
	@PostMapping("/update_process.do")
	public String update_process(MemberVo memberVo, HttpServletRequest request) {
		
		MemberVo vo = mUpdate.update(memberVo);
		
		String viewPage = "member/update";
		
		if(vo != null){//회원정보 수정 성공시
			HttpSession session = request.getSession();
			session.removeAttribute("member");
			session.setAttribute("member", vo);
			viewPage = "redirect:/index.do";
		}
		
		return viewPage;
	}
	
	@GetMapping("/cancel.do")
	public String cancel() {
				
		return "member/cancel";
	}
	
	@GetMapping("/cancel_process.do")
	public String cancel_process(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		MemberVo vo = (MemberVo)session.getAttribute("member");
		int member_idx = vo.getMember_idx();
		
		int result = mCancel.cancel(member_idx);
		
		String viewPage = "member/update";
		
		if(result == 1){//회원탈퇴 성공시
			session.invalidate();
			viewPage = "redirect:/index.do";

		}
		
		return viewPage;
	}
	
}
