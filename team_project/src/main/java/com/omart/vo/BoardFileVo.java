package com.omart.vo;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class BoardFileVo {
	private int b_idx;
	private String m_name;
	private String p_id;
	private int m_idx;
	private String m_id;
	private String title;
	private String content;
	private Timestamp post_date;
	private int read_count;
	private int end_state;
	private Timestamp edit_date;
	private String originFile;
	private String saveFile;
	private int stars;
	private int category;
	private String period;
	private String tableName;
	private int reply_state;
	private String ans_content;
	private Timestamp ans_date;
	private String order_idx;
	private int grade;
}
