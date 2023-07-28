package com.omart.vo;

import java.sql.Timestamp;
import java.util.Date;

import lombok.Data;

@Data
public class BoardFileVo {
	
	/* 게시물 통합 DTO */
	
	//게시물 기본정보
	private int b_idx;			//게시물 번호(고유번호)
	private int m_idx;			//작성자 번호(회원 번호)
	private String m_id;		//작성자 아이디(회원 아이디)
	private String title;		//게시물 제목
	private String content;		//게시물 내용
	private Timestamp post_date;//게시물 등록일
	private Timestamp edit_date;//게시물 수정일
	private int read_count;		//게시물 조회수
	
	//게시물 첨부파일
	private String originFile;	//게시물 원본 파일명
	private String saveFile;	//게시물 저장 파일명
	
	//이벤트 게시물
	private int end_state;		//이벤트 종료여부 (0: 진행중 / 1: 종료)
	
	//상품리뷰 게시물
	private String p_id;		//제품코드
	private int stars;			//제품리뷰 별점
	
	//1:1문의 게시물
	private int category;		//문의 카테고리(1:1문의 범주)
	
//	private Timestamp up_date;
}
