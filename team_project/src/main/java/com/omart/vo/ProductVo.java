package com.omart.vo;

import java.util.List;

import lombok.Data;

@Data
public class ProductVo {
	private String p_id;
	private String p_name;
	private String brand;
	private int cost;
	private int price;
	private int standard;
	private  String unit;
	private int stock;
	private int discount;
	private int post_state;
	private List<String> selectedCategories;
}
