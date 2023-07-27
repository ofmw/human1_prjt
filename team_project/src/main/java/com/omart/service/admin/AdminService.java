package com.omart.service.admin;

import com.omart.vo.ProductVo;

public interface AdminService {

	default int countCategory(String category) {return 0;}
	default int insertProduct(ProductVo productVo) {return 0;}
	
}
