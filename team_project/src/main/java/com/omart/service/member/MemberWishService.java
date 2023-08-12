package com.omart.service.member;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.omart.dao.MemberDao;
import com.omart.vo.ProductVo;

import lombok.Setter;

@Service("mWish")
public class MemberWishService implements MemberService {
	
	@Setter(onMethod_={ @Autowired })
	private MemberDao dao;
	
	public List<String> getWishList(int m_idx){
		return dao.getWishList(m_idx);
	}
	
	public List<ProductVo> getP_info(List<String> wish) {
		return dao.getP_info(wish);
	}
	
	public void insertWish(int m_idx) {
		dao.insertWish(m_idx);
	}
	
	//찜목록 삭제
	public int removeWishList(int m_idx, String [] p_id) {
		return dao.removeWishList(m_idx, p_id);
	}
	
}