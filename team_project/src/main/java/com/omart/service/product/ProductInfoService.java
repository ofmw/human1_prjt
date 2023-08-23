package com.omart.service.product;

import org.springframework.stereotype.Service;

import com.omart.dao.ProductDao;
import com.omart.vo.ProductVo;

import lombok.RequiredArgsConstructor;

@Service("pdInfo")
@RequiredArgsConstructor
public class ProductInfoService implements ProductService {	
	
	private final ProductDao dao;
	
	public ProductVo getProduct(String p_id) {
		return dao.getProduct(p_id);
	}	
	
	public void updateTotalSales(ProductVo pVo) {
		dao.updateTotalSales(pVo);
	}	
	
	public double getStarsAvg(String p_id) {
		return dao.getStarsAvg(p_id);
	}
	
	public int getReviews(String p_id) {
		return dao.getReviews(p_id);
	}
	
	public void updateStock(ProductVo pVo) {
		dao.updateStock(pVo);
	}
	
}
