package com.omart.service.product;

import org.springframework.stereotype.Service;

import com.omart.dao.ProductDao;
import com.omart.vo.ProductVo;

import lombok.RequiredArgsConstructor;

@Service("pdSet")
@RequiredArgsConstructor
public class ProductSetStockService implements ProductService {	
	
	private final ProductDao dao;
	
	public void setStock(ProductVo pVo) {
		dao.setStock(pVo);
	}	
	
}
