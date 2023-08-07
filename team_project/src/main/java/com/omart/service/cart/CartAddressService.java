package com.omart.service.cart;

import java.util.List;

import org.springframework.stereotype.Service;

import com.omart.dao.CartDao;
import com.omart.vo.AddressVo;

import lombok.RequiredArgsConstructor;

@Service("cAddress")
@RequiredArgsConstructor
public class CartAddressService implements CartService {	
	
	private final CartDao dao;
	
	//해당 회원의 배송지 정보 가져오기
	public List<AddressVo> AddressList(int m_idx) {
		
		return dao.AddressList(m_idx);
	}
	
}
