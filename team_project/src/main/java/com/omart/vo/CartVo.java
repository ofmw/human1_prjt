package com.omart.vo;

import lombok.Data;

@Data
public class CartVo {
	
	/* 장바구니 DTO */
	
	private int m_idx;		//회원 고유번호
	private String p_id;	//제품코드
	private int amount;		//수량
	
	//제품 기본정보
	private String p_name;					//제품명
	private String brand;					//브랜드명
	
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
	
	//썸네일
	private String saveFile1;
}
