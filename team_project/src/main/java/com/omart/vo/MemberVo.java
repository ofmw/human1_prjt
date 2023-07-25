package com.omart.vo;


import java.sql.Timestamp;
import java.util.Date;

import lombok.Data;

@Data
public class MemberVo {//데이터를 저장해서 전달하는 역할을 주로하는 클래스: DTO(Data Transfer Object)
	//필드의 접근지정자: private	
	//회원가입정보 화면을 보면서 만든 필드들
	private String m_name;
	private int gender;
	private int selNum;
	private int m_idx;
	private String birth;
	private String m_id;
	private String m_pw;
	private Timestamp j_date;
	private Timestamp u_date;
	private Timestamp a_date;
	private int a_state;
	private Timestamp login_date;
	private int platform;
	private int grade;
	
}
