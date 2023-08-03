package com.omart.service.product;

import java.util.List;

import org.springframework.stereotype.Service;

import com.omart.dao.ProductDao;
import com.omart.vo.ProductVo;

import lombok.RequiredArgsConstructor;

@Service("pdList")
@RequiredArgsConstructor
public class ProductListService implements ProductService {	
	
	private final ProductDao dao;
	
	public List<ProductVo> ProductList() {
		
		return dao.productList();
	}
	
	public List<ProductVo> bestList(){
		return dao.bestList();
	}
	
}
