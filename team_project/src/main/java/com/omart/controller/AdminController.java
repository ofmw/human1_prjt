package com.omart.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.omart.service.admin.AdminService;
import com.omart.service.boardfile.BoardFileListService;
import com.omart.service.product.ProductService;
import com.omart.vo.BoardFileVo;
import com.omart.vo.MemberVo;
import com.omart.vo.OrderVo;
import com.omart.vo.ProductVo;

import lombok.Setter;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Setter(onMethod_= {@Autowired})
	private ProductService pdList, pdInfo;
	@Setter(onMethod_= {@Autowired})	
	private AdminService mList, odrList;
	@Setter(onMethod_= {@Autowired})
	private BoardFileListService bfList;
	
	@GetMapping("/member.do")
	public String member(Model model) {
		model.addAttribute("status", "member");
		
		List<MemberVo> memberList = mList.memberList();
		
		model.addAttribute("memberList", memberList);
				
		return "admin/admin";
	}	
	@GetMapping("/product.do")
	public String product(Model model) {
		model.addAttribute("status", "product");
		
		List<ProductVo> productList = pdList.productList();
		
		//좌측 체크박스 생성을 위한 List 생성
	    List<String> brandList = new ArrayList<String>(); //브랜드
	    List<String> subCategoryList = new ArrayList<String>(); //카테고리 소분류
	    for(ProductVo product : productList) {
	    	
	    	String p_id = product.getP_id();
	    	product.setStars_avg(pdInfo.getStarsAvg(p_id));
	    	product.setReviews(pdInfo.getReviews(p_id));
	    	
	    	//중복 방지
	    	if(!brandList.contains(product.getBrand())) {
	    		brandList.add(product.getBrand());
	    	}
	    	if(!subCategoryList.contains(product.getSub_category())) {
	    		subCategoryList.add(product.getSub_category());
	    	}
	    }
		
	    Map<String, List<String>> categoryList = new LinkedHashMap<String, List<String>>();	    
	    categoryList.put("brand",brandList);	 
	    categoryList.put("sub", subCategoryList);
		
		model.addAttribute("productList", productList);
		
		model.addAttribute("categoryList", categoryList);
		
		return "admin/admin";
	}		
	@GetMapping("/authority.do")
	public String authority(Model model) {
		model.addAttribute("status", "authority");
		
		List<MemberVo> memberList = mList.adminList();
		
		model.addAttribute("memberList", memberList);
				
		return "admin/admin";
	}
	@GetMapping("/inquiry.do")
	public String inquiry(@RequestParam(value = "b_idx", required = false) String b_idxStr, Model model) {
		
		/*
		 * if (b_idxStr != null) { try { int b_idx = Integer.parseInt(b_idxStr); //
		 * b_idx 값을 이용해 처리할 로직 추가 // ... } catch (NumberFormatException e) { // b_idx 값을
		 * 숫자로 변환할 수 없는 경우에 대한 처리 // ... } }
		 */
		
		model.addAttribute("status", "inquiry");
		
		// inquiries 데이터 가져오기
	    List<BoardFileVo> inquiryList = bfList.getAllInquiries();
	    
	    // qna 데이터 가져오기
	    List<BoardFileVo> qnaList = bfList.getAllQnas();
	    
		// inquiries 데이터에 tableName 설정
	    if(inquiryList != null) {
	    	for (BoardFileVo inquiry : inquiryList) {
			    inquiry.setTableName("inquiries");
			}
	    }

		// qna 데이터에 tableName 설정
	    if(qnaList != null) {
	    	for (BoardFileVo qna : qnaList) {
			    qna.setTableName("qna");
			}
	    }		
	    
	    // inquiries와 qna 데이터를 합친 리스트 생성	    
	    if(inquiryList != null && qnaList != null) {
	    	List<BoardFileVo> combinedList = new ArrayList<>();
	    	combinedList.addAll(inquiryList);
		    combinedList.addAll(qnaList);
		    Collections.sort(combinedList, (bf1, bf2) -> bf2.getPost_date().compareTo(bf1.getPost_date()));
		    // 합쳐진 데이터를 JSP로 전달
		    model.addAttribute("combinedList", combinedList);
		    
	    }	   
		
		return "admin/admin";
	}	
	
	@GetMapping("/order.do")
	public String order(Model model) {
		model.addAttribute("status", "order");
		
		List<OrderVo> orderList = odrList.orderList();
		model.addAttribute("orderList", orderList);
		return "admin/admin";
	}		
		
}
