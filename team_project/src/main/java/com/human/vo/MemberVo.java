package com.human.vo;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVo {//데이터를 저장해서 전달하는 역할을 주로하는 클래스: DTO(Data Transfer Object)
	//필드의 접근지정자: private	
	//회원가입정보 화면을 보면서 만든 필드들
	private String member_id;
	private String member_pw;
	private String member_name;
	private int gender;
	private String selNum;
	
	//DB에 저장되는 Member테이블을 생각하면서 만든 필드들
	//회원번호: 기본키로 사용될 컬럼
	private int member_idx;
	//회원가입일
	private Date join_date;
	//회원정보 수정일
	private Date update_date;
	//회원탈퇴일
	private Date cancel_date;
	//회원탈퇴여부(1:회원유지, -1:회원탈퇴)
	private int cancel_or_not;
	//회원등급: 일반회원, 관리자, 슈퍼관리자
	private int grade;
	
}
