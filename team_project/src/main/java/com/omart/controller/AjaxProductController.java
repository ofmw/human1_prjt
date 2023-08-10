package com.omart.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.omart.service.member.MemberService;
import com.omart.service.product.ProductService;

import lombok.Setter;

@RestController
@RequestMapping("/product")
public class AjaxProductController {
	
	@Setter(onMethod_={ @Autowired })
	private ProductService pdWish;
	@Setter(onMethod_={ @Autowired })
	private MemberService mWish;
	
	//찜목록 추가
	@RequestMapping("/add_wishList.do")
	public String add_wishList(@RequestParam("m_idx") int m_idx,
							   @RequestParam("p_id") String p_id,
							   HttpSession session) {
		
		List<String> checkWish = mWish.getWishList(m_idx);
		
		if(checkWish == null) {
			mWish.insertWish(m_idx);
		}
		
		//찜목록에 해당 p_id를 추가하고 테이블 업데이트 결과 반환
		int result = pdWish.addWishList(m_idx, p_id);
		if (result == 1) { //업데이트에 성공했을 경우
			
			List<String> wishList = mWish.getWishList(m_idx);
			//기존의 찜목록 객체 삭제 및 저장
			session.removeAttribute("wishList");
			session.setAttribute("wishList", wishList);
		}
		
		return "success";
	}

	//찜목록 삭제
	@RequestMapping("/remove_wishList.do")
	public String remove_wishList(@RequestParam("m_idx") int m_idx,
							   @RequestParam("p_id") String p_id,
							   HttpSession session) {
		
		//찜목록에 해당 p_id를 삭제하고 테이블 업데이트 결과 반환
		int result = pdWish.removeWishList(m_idx, p_id);
		if (result == 1) { //업데이트에 성공했을 경우
			
			List<String> wishList = mWish.getWishList(m_idx);
			//기존의 찜목록 객체 삭제 및 저장
			session.removeAttribute("wishList");
			session.setAttribute("wishList", wishList);
		}
		
		return "success";
	}
	
	
}
