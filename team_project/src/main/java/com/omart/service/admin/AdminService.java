package com.omart.service.admin;

import java.util.List;

import com.omart.vo.MemberVo;
import com.omart.vo.ProductVo;

public interface AdminService {

	default int countCategory(String category) {return 0;}
	default int insertProduct(ProductVo productVo) {return 0;}
	default List<MemberVo> MemberList() {return null;}
	
}
