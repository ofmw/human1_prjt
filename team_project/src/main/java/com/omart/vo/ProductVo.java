package com.omart.vo;

import java.util.List;

import lombok.Data;

@Data
public class ProductVo {
	
	/* 제품 정보 DTO */
	
	//제품 기본정보
	private String p_id;					//제품코드 //제품코드 앞 두자리는 카테고리 대분류 ex)AA = 육류, BB = 가공...
	private String p_name;					//제품명
	private String brand;					//브랜드명
	private String sub_category;			//카테고리 소분류
	
	//제품 가격
	private int cost;						//원가
	private int price;						//판매가
	
	//제품 용량
	private int standard;					//규격 (숫자 값)
	private  String unit;					//단위 (kg, g, L, cc, ···)
	
	//제품 기타정보
	private int stock;						//재고
	private int discount;					//할인율
	private int post_state;					//제품 게시여부(판매 등록여부)
	private List<String> selectedCategories;//
	
	private int salesAmount; // 주문 판매량
	
	//주문당 Product 개별 조회시 필요한 필드 목록
	private int review_state; //회원이 조회하는 주문번호에 해당되는 제품의 리뷰 작성 유무
	private String order_idx; //주문번호와 p_idx로 제품 리뷰 작성 유무 판단을 위한 필드
	private double stars; // 평균별점
}
