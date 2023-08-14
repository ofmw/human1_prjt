package com.omart.service.cart;

import java.util.List;

import org.springframework.stereotype.Service;

import com.omart.dao.CartDao;
import com.omart.vo.CartVo;

import lombok.RequiredArgsConstructor;

@Service("cAdd")
@RequiredArgsConstructor
public class CartAddService implements CartService {	
	
	private final CartDao dao;
	
	//해당 회원의 장바구니 정보 가져오기
	public void addCart(CartVo cartVo) {		
		dao.addCart(cartVo);
	}	
	
	//마이페이지 찜목록 장바구니 추가 (임시)
	public int addCart2(int m_idx, String [] p_id) {
		return dao.addCart2(m_idx, p_id);
	}
}
