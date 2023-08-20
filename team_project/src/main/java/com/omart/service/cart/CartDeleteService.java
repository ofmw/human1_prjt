package com.omart.service.cart;

import org.springframework.stereotype.Service;

import com.omart.dao.CartDao;

import lombok.RequiredArgsConstructor;

@Service("cDel")
@RequiredArgsConstructor
public class CartDeleteService implements CartService {	
	
	private final CartDao dao;
	
	//해당 회원의 장바구니 정보 가져오기
	public void deleteCartAll(int m_idx) {	
		System.out.println("서비스 진입 확인");
		dao.deleteCartAll(m_idx);
	}	
	
}
