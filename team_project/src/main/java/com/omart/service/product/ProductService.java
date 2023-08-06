package com.omart.service.product;

import java.util.List;

import com.omart.vo.ProductVo;

public interface ProductService {
	
	default List<ProductVo> productList() {return null;}
	default List<ProductVo> bestList() {return null;}
	default List<ProductVo> saleList() {return null;}
	default List<ProductVo> newList() {return null;}
}
