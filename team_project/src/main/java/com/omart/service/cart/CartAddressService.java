package com.omart.service.cart;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	//해당 회원의 기본 배송지 업데이트
	public List<AddressVo> updateDefAddress(int m_idx, String a_name) {
		
		dao.updateDefAddress(m_idx, a_name);
		return dao.AddressList(m_idx);
	}
	
}
