package com.omart.vo;

import lombok.Data;

@Data
public class AddressVo {
	
	/* 주소 DTO */
	
	private int m_idx;			//회원 고유번호
	private String a_name;		//배송지 이름(별칭)	
	private String receiver;	//받는분 이름
	private String selnum;		//받는분 전화번호
	private String postnum; 	//우편번호
	private String roadAddr; 	//도로명 주소
	private String jibunAddr; 	//지번 주소
	private String detail;		//상세주소
	private int def_add;		//기본배송지 여부
	
	//배송지 수정용
	private String original_a_name; 
}
