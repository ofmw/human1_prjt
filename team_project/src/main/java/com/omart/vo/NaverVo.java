package com.omart.vo;


import java.sql.Timestamp;
import java.util.Date;

import lombok.Data;

@Data
public class NaverVo {
	
	/* 네이버 계정 DTO */
	
	//계정 정보
	private int m_idx;				//회원 번호(고유번호)
	private String m_id;			//아이디
	private Timestamp j_date;		//가입일
	private Timestamp a_date;		//휴면계정 전환일
	private int a_state;			//계정 활성화 여부 (0: 휴면계정 / 1: 활성계정)
	private Timestamp login_date;	//최근(마지막) 로그인 일시
	private int grade;				//회원등급 (0~2: 브론즈, 실버, 골드 / 7~9: 문의, 제품, 슈퍼)
	
	//회원 개인정보
	private String m_name;			//이름
	private int gender;				//성별
	private String selNum;			//전화번호
	private Date birth;				//생년월일
}
