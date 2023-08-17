package com.omart.service.product;

import org.springframework.stereotype.Service;

import com.omart.dao.ProductDao;
import com.omart.vo.ProductVo;

import lombok.RequiredArgsConstructor;

@Service("pdCheck")
@RequiredArgsConstructor
public class ProductCheckService implements ProductService {	
	
	private final ProductDao dao;
	
	public int checkReview(ProductVo pVo) {
		return dao.checkReview(pVo);
	}
	
}
