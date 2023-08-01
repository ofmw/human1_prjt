package com.omart.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.omart.vo.ProductVo;

@Controller
@RequestMapping("/product")
public class ProductController {
		
	//상품페이지
	@GetMapping("/product_list.do")
	public String mypage() {
		return "product/product_list";
	}
	
	@GetMapping("/index.do")
	public String index() {
		
		return "product/product_list";/* 뷰의 이름 */
	}
	
	//상품페이지 -> 로그아웃
//	@GetMapping("/logout.do")
//	public String logout(HttpServletRequest request) {
//		
//		String viewPage = "redirect:/index.do";
//		HttpSession session = request.getSession();
//		session.invalidate();
//		
//		return viewPage;
//	}
}
