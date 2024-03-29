package com.omart.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.omart.service.product.ProductService;
import com.omart.vo.ProductVo;

import lombok.Setter;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Setter(onMethod_= {@Autowired})
	private ProductService pdList, pdInfo;
	
	//임시로 메인페이지에 상품 리스트 불러오는 메서드
	@GetMapping("/")
	public String home(Model model) {
		
		List<ProductVo> bestList = pdList.bestList();
		List<ProductVo> saleList = pdList.saleList();
		List<ProductVo> newList = pdList.newList();
		
		for(ProductVo best : bestList) {
			String p_id = best.getP_id();
			double stars_avg = pdInfo.getStarsAvg(p_id);	//평균 별점
			int reviews = pdInfo.getReviews(p_id);			//리뷰 갯수
			
			best.setStars_avg(stars_avg);
			best.setReviews(reviews);
		}
		
		for(ProductVo sales : saleList) {
			String p_id = sales.getP_id();
			double stars_avg = pdInfo.getStarsAvg(p_id);	//평균 별점
			int reviews = pdInfo.getReviews(p_id);			//리뷰 갯수
			
			sales.setStars_avg(stars_avg);
			sales.setReviews(reviews);
		}
		
		for(ProductVo news : newList) {
			String p_id = news.getP_id();
			double stars_avg = pdInfo.getStarsAvg(p_id);	//평균 별점
			int reviews = pdInfo.getReviews(p_id);			//리뷰 갯수
			
			news.setStars_avg(stars_avg);
			news.setReviews(reviews);
		}
				
		model.addAttribute("bestList", bestList);
		model.addAttribute("saleList", saleList);
		model.addAttribute("newList", newList);
		
		return "index";/* 뷰의 이름 */
	}

	@GetMapping("boardFile/list_inquiry")
	public String home2() {

		return "boardFile/list_inquiry";/* 뷰의 이름 */
	}

	@GetMapping("/index.do")
	public String index(Model model) {
		
		List<ProductVo> bestList = pdList.bestList();
		List<ProductVo> saleList = pdList.saleList();
		List<ProductVo> newList = pdList.newList();
		
		for(ProductVo best : bestList) {
			String p_id = best.getP_id();
			double stars_avg = pdInfo.getStarsAvg(p_id);	//평균 별점
			int reviews = pdInfo.getReviews(p_id);			//리뷰 갯수
			
			best.setStars_avg(stars_avg);
			best.setReviews(reviews);
		}
		
		for(ProductVo sales : saleList) {
			String p_id = sales.getP_id();
			double stars_avg = pdInfo.getStarsAvg(p_id);	//평균 별점
			int reviews = pdInfo.getReviews(p_id);			//리뷰 갯수
			
			sales.setStars_avg(stars_avg);
			sales.setReviews(reviews);
		}
		
		for(ProductVo news : newList) {
			String p_id = news.getP_id();
			double stars_avg = pdInfo.getStarsAvg(p_id);	//평균 별점
			int reviews = pdInfo.getReviews(p_id);			//리뷰 갯수
			
			news.setStars_avg(stars_avg);
			news.setReviews(reviews);
		}
				
		model.addAttribute("bestList", bestList);
		model.addAttribute("saleList", saleList);
		model.addAttribute("newList", newList);
		
		return "index";/* 뷰의 이름 */
	}
	
	//로그아웃
	@GetMapping("/**/logout.do")
	public String logout(String requestor, HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		
			String referer = request.getHeader("referer");
			System.out.println(referer);
		
		return "member/logout.jsp?referer="+referer;
	}
	
	//임시
	@GetMapping("/**/payment.do")
	public String payment() {
		return "payment/payment";
	}
	
}
