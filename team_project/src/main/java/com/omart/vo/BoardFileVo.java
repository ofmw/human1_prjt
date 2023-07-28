package com.omart.vo;

import java.sql.Timestamp;
import java.util.Date;

import lombok.Data;

@Data
public class BoardFileVo {
	private int b_idx;
	private String p_id;
	private int m_idx;
	private String m_id;
	private String title;
	private String content;
	private Timestamp post_date;
//	private Timestamp up_date;
	private int read_count;
	private int end_state;
	private Timestamp edit_date;
	private String originFile;
	private String saveFile;
	private int stars;
	private int category;

	
}
