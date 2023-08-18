package com.omart.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import com.omart.vo.MemberVo;

public class LoginInterceptor implements HandlerInterceptor {	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
		throws Exception {
		boolean result = true; //Controller로 사용자의 요청이 전달되게 하는 반환값
		
		HttpSession session = request.getSession();
		MemberVo member = (MemberVo)session.getAttribute("member");
		
		if(member == null) {
			response.sendRedirect(request.getContextPath()+"/index.do");
			result = false; //Controller로 사용자 요청이 전달되지 못하도록 하는 반환값
		}
		
		return result;
	}	  

}
