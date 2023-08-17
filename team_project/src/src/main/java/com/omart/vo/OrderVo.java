package com.omart.vo;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class OrderVo {
	
	private String order_idx; 
	private int m_idx; 
	private String brands; 
	private String productNames; 
	private String products; 
	private String amounts; 
	private String products_price; 
	private String request; 
	private String message; 
	private int s_fee; 
	private Timestamp order_date; 
	private Timestamp cancel_date; 
	private int cancel_state;
	private String receiver;
	private String selnum;
	private String address;
	private int paid_price;
	private int order_state;
	private String paymentInfo;
	private int used_point;
	
	//주문한 상품 개수
	private int p_amount;
}