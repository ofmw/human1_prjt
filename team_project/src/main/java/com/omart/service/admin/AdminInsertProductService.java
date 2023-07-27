package com.omart.service.admin;

import org.springframework.stereotype.Service;

import com.omart.dao.AdminDao;
import com.omart.vo.ProductVo;

import lombok.RequiredArgsConstructor;

@Service("pdInsert")
@RequiredArgsConstructor
public class AdminInsertProductService implements AdminService {	
	
	private final AdminDao dao;
	
	public int insertProduct(ProductVo productVo) {
		
		return dao.insertProduct(productVo);
	}
	
}
