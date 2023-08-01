package com.omart.service.admin;

import org.springframework.stereotype.Service;

import com.omart.dao.AdminDao;
import com.omart.vo.ProductVo;

import lombok.RequiredArgsConstructor;

@Service("pdEdit")
@RequiredArgsConstructor
public class AdminEditProductService implements AdminService {	
	
	private final AdminDao dao;
	
	public int editProduct(ProductVo productVo) {
		
		return dao.editProduct(productVo);
	}
	
}
