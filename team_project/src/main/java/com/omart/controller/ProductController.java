package com.omart.controller;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.omart.service.member.MemberService;
import com.omart.service.product.ProductService;
import com.omart.vo.BoardFileVo;
import com.omart.vo.MemberVo;
import com.omart.vo.ProductVo;

import lombok.Setter;

@Controller
@RequestMapping("/product")
public class ProductController {
	
	@Setter(onMethod_= {@Autowired})
	private ProductService pdList, pdInfo;
	
	@Setter(onMethod_= {@Autowired})
	private MemberService mReview, mInfo;
		
	//상품페이지
	@GetMapping("/product_list.do")
	public String productList(String category, Model model, HttpServletRequest request) {
		
		System.out.println("카테고리 체크 : "+category);
		
			
		List<ProductVo> productList = pdList.productList();
	    
	    if(category != null) {
	    	productList.removeIf(product -> !product.getP_id().startsWith(category));
	    }
	    
	    
	    //좌측 체크박스 생성을 위한 List 생성
	    List<String> brandList = new ArrayList<String>(); //브랜드
	    List<String> subCategoryList = new ArrayList<String>(); //카테고리 소분류
	    for(ProductVo product : productList) {
	    	//중복 방지
	    	if(!brandList.contains(product.getBrand())) {
	    		brandList.add(product.getBrand());
	    	}
	    	if(!subCategoryList.contains(product.getSub_category())) {
	    		subCategoryList.add(product.getSub_category());
	    	}
	    }
		
	    Map<String, List<String>> categoryList = new LinkedHashMap<String, List<String>>();	    
	    categoryList.put("브랜드",brandList);	 
	    categoryList.put("분류", subCategoryList);
	    
		//model.addAttribute("productList", productList);
	    
		// post_state가 1이 아닌 제품 제거
	    productList.removeIf(product -> product.getPost_state() != 1);
		
		HttpSession session = request.getSession();
		session.setAttribute("productList", productList);
	    
		model.addAttribute("categoryList", categoryList);
		
		return "product/product_list";
	}
	
	@GetMapping("/product_view.do")
	public String productView(@RequestParam("p_id") String p_id, Model model) {
		ProductVo vo = pdInfo.getProduct(p_id);
		
		vo.setStars_avg(pdInfo.getStarsAvg(p_id));
		vo.setReviews(pdInfo.getReviews(p_id));
		
		List<BoardFileVo> ReviewList =  mReview.selectReviewList(p_id);
		
		if(ReviewList != null) {
			for(BoardFileVo review : ReviewList) {
				String order_idx = review.getOrder_idx();
				String m_name = mInfo.getMemberNameFromOrder(order_idx);
				int grade = mInfo.getGradeFromOrder(order_idx);
				
				review.setM_name(m_name);
				review.setGrade(grade);
			}
		}
		
		model.addAttribute("product",vo);		
		model.addAttribute("ReviewList", ReviewList);
		return "product/product_view";
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
