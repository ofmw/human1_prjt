package com.omart.service.product;

import java.util.List;

import com.omart.vo.ProductVo;

public interface ProductService {
	
	default List<ProductVo> ProductList() {return null;}
	default List<ProductVo> bestList() {return null;}
	
}
