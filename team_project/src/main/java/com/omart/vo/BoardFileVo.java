package com.omart.vo;

import java.util.Date;

import lombok.Data;

@Data
public class BoardFileVo {
	private int board_idx;
	private String title;
	private String content;
	private String originFile;
	private String saveFile;
	private Date post_date;
	private int read_count;
	private int member_idx;
	private String member_name;
	private int del_or_not;
	private Date del_date;	
	
}
