package com.omart.service.admin;

import java.util.List;

import org.springframework.stereotype.Service;

import com.omart.dao.AdminDao;
import com.omart.service.product.ProductService;
import com.omart.vo.MemberVo;

import lombok.RequiredArgsConstructor;

@Service("mList")
@RequiredArgsConstructor
public class AdminMemberListService implements AdminService {	
	
	private final AdminDao dao;
	
	public List<MemberVo> MemberList() {
		return dao.memberList();
	}
	
}
