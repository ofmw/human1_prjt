package com.omart.service.member;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.omart.dao.MemberDao;

import lombok.Setter;

@Service("mWish")
public class MemberWishService implements MemberService {
	
	@Setter(onMethod_={ @Autowired })
	private MemberDao dao;
	
	public List<String> getWishList(int m_idx){
		return dao.getWishList(m_idx);
	}
	
	public void insertWish(int m_idx) {
		dao.insertWish(m_idx);
	}
	
}