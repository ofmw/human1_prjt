package com.omart.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.omart.service.cart.CartService;
import com.omart.service.member.MemberService;
import com.omart.vo.MemberVo;
import com.omart.vo.ProductVo;

import lombok.Setter;

@RestController
@RequestMapping("/mypage")
public class AjaxMypageController {
	
	@Setter(onMethod_={ @Autowired })
	private MemberService mWish;
	@Setter(onMethod_={ @Autowired })
	private CartService cAdd;
	
	//찜목록 선택 상품 삭제
	@PostMapping("/remove_wishList.do")
	public String remove_wishList(@RequestParam("p_id[]") String [] p_id,
								  HttpSession session) {
		
		MemberVo member = (MemberVo) session.getAttribute("member");
		int m_idx = member.getM_idx();
		
		//찜목록에 해당 p_id를 삭제하고 테이블 업데이트 결과 반환
		int result = mWish.removeWishList(m_idx, p_id);
		if (result != 0) { //업데이트에 성공했을 경우
			
			List<String> wishList = mWish.getWishList(m_idx);
			List<ProductVo> p_info = mWish.getP_info(wishList);
			
			//기존의 찜목록 객체 삭제 및 저장
			session.removeAttribute("wishList");
			session.removeAttribute("p_info");
			session.setAttribute("wishList", wishList);
			session.setAttribute("p_info", p_info);
		}
		
		return "success";
	}
	
	//장바구니 선택 상품 추가
	@PostMapping("/addCart.do")
	public String addCart(@RequestParam("p_id[]") String [] p_id,
			 			  HttpSession session) {
		
		MemberVo member = (MemberVo) session.getAttribute("member");
		int m_idx = member.getM_idx();
		
		int result = cAdd.addCart2(m_idx, p_id);
		
		if (result != 0) {
			return "success";
		} else {
			return "fail";
		}
		
	}
}
