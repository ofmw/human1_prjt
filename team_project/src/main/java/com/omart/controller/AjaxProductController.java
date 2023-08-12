package com.omart.controller;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.omart.service.member.MemberService;
import com.omart.service.product.ProductService;
import com.omart.vo.ProductVo;

import lombok.Setter;

@RestController
@RequestMapping("/product")
public class AjaxProductController {
	
	@Setter(onMethod_={ @Autowired })
	private ProductService pdWish;
	@Setter(onMethod_={ @Autowired })
	private MemberService mWish;	
	@Setter(onMethod_= {@Autowired})
	private ProductService pdList;
	
	//찜목록 추가
	@RequestMapping("/add_wishList.do")
	public String add_wishList(@RequestParam("m_idx") int m_idx,
							   @RequestParam("p_id") String p_id,
							   HttpSession session) {
		
		List<String> checkWish = mWish.getWishList(m_idx);
		
		if(checkWish == null) {
			System.out.println("찜목록 비어있음");
			mWish.insertWish(m_idx);
			
		}
			System.out.println("찜목록 차있음");
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

	@RequestMapping("/update_product_list.do")
	public List<ProductVo> update_product_list(@RequestBody Map<String, String[]> checkedMap, Model model, String category){
		
		String[] checked_brand = checkedMap.get("1");
		String[] checked_sub_category = checkedMap.get("2");
		
		System.out.println(Arrays.toString(checked_brand));
		System.out.println(Arrays.toString(checked_sub_category));
		
		List<ProductVo> productList = pdList.productList();
		
		//post_state가 1이 아닌 객체 삭제
		productList.removeIf(product -> product.getPost_state() != 1);
		
		//대분류가 선택되었을때 대분류에 속하지 않은 객체 삭제
		if(category != null) {
	    	productList.removeIf(product -> !product.getP_id().startsWith(category));
	    } 		
		
	    // 선택한 브랜드 이외의 객체 삭제
	    if (checked_brand != null) {
	        productList.removeIf(product -> !Arrays.asList(checked_brand).contains(product.getBrand()));
	    }
	    
	    //선택한 분류 이외의 객체 삭제
	    if (checked_sub_category != null) {
	        productList.removeIf(product -> !Arrays.asList(checked_sub_category).contains(product.getSub_category()));
	    }
	    
	    for(ProductVo product : productList) {
	    	System.out.println(product.toString());
	    }
	    	    
		return productList;
	}
	
}
