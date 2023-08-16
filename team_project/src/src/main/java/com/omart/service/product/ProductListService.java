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
	
	public List<ProductVo> productList() {
		
		return dao.productList();
	}
	
	public List<ProductVo> bestList(){
		return dao.bestList();
	}
	
	public List<ProductVo> saleList(){
		return dao.saleList();
	}
	
	public List<ProductVo> newList(){
		return dao.newList();
	}
	
}
