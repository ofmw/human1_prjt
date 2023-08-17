package com.omart.service.member;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.omart.dao.MemberDao;
import com.omart.vo.MemberVo;

import lombok.Setter;

@Service("mInfo")
public class MemberInfoService implements MemberService {
	
	@Setter(onMethod_={ @Autowired })
	private MemberDao dao;
	
	public String getMemberNameFromOrder(String order_idx) {
		return dao.getMemberNameFromOrder(order_idx);
	}
	
	public int getGradeFromOrder(String order_idx) {
		return dao.getGradeFromOrder(order_idx);
	}
	
}