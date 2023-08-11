package com.omart.vo;


import java.sql.Timestamp;

import lombok.Data;

@Data
public class MemberVo {
	
	/* 일반 계정 DTO */
	
	//세션 판별용
	private String platform;
	
	//계정 정보
	private int m_idx;				//회원 번호(고유번호)
	private String m_id;			//아이디
	private String m_pw;			//비밀번호
	private Timestamp j_date;		//가입일
	private Timestamp u_date;		//회원정보 수정일
	private Timestamp a_date;		//휴면계정 전환일
	private int a_state;			//계정 활성화 여부 (0: 휴면계정 / 1: 활성계정)
	private Timestamp login_date;	//최근(마지막) 로그인 일시
	private int grade;				//회원등급
	
	//회원 개인정보
	private String m_name;			//이름
	private int gender;			//성별
	private String selNum;			//전화번호
	private String birth;			//생년월일
	private int point;				//포인트
}
