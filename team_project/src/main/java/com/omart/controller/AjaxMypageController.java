package com.omart.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
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
	
	//찜목록 상품 정렬
	@PostMapping("/sort_wishList.do")
	public String sort_wishList(@RequestParam("option") String option,
								HttpSession session,
								Model model) {
		
		MemberVo member = (MemberVo) session.getAttribute("member");
		int m_idx = member.getM_idx();
		
		@SuppressWarnings("unchecked")
		List<ProductVo> p_info = (List<ProductVo>) session.getAttribute("p_info");
		System.out.println(p_info);
		System.out.println(option);
		
		if (option.equals("name")) {
			// 세션에서 가져온 p_info 리스트를 p_name 순으로 정렬
			Collections.sort(p_info, Comparator.comparing(ProductVo::getP_name));
			System.out.println("수정된 리스트: "+p_info);
			
			// 수정된 p_info에서 p_id를 추출하여 wishList 배열에 저장
			List<String> wishList = new ArrayList<>();
	        for (ProductVo product : p_info) {
	            wishList.add(product.getP_id());
	        }
			
			System.out.println("수정된 찜목록: "+wishList);
			
			session.removeAttribute("wishList");
			session.removeAttribute("p_info");
			session.setAttribute("wishList", wishList);
			session.setAttribute("p_info", p_info);
			
		} else if (option.equals("date")) {
			
		    List<String> wishList = mWish.getWishList(m_idx);

		    // 세션에서 가져온 p_info 리스트에서 wishList의 순서대로 p_id를 기준으로 정렬
		    List<ProductVo> sortedPInfo = new ArrayList<>();
		    for (String productId : wishList) {
		        for (ProductVo product : p_info) {
		            if (product.getP_id().equals(productId)) {
		                sortedPInfo.add(product);
		                break;
		            }
		        }
		    }
		    
		    // 세션에서 수정된 p_info와 wishList를 저장
		    session.removeAttribute("wishList");
		    session.removeAttribute("p_info");
		    session.setAttribute("wishList", wishList);
		    session.setAttribute("p_info", sortedPInfo);
		}
		
		return "success";
	}
	
	//찜목록 선택 상품 장바구니 추가
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
