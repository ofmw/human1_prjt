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
	
	//해당 회원의 기본 배송지 업데이트
	public List<AddressVo> updateDefAddress(int m_idx, String a_name) {
		
		dao.updateDefAddress(m_idx, a_name);
		return dao.AddressList(m_idx);
	}
	
	//해당 회원의 배송지 추가 유효성 검사
	public int checkNewAddr(AddressVo vo) {
		
		int Aname_result = dao.checkAname(vo);
		int Addr_result = dao.checkAddr(vo);
		
		int result = 0;
		
		if (Aname_result != 0) {
			result = 1;
		} else if (Addr_result != 0) {
			result = 2;
		}
		
		return result;
	}
	
	//해당 회원의 배송지 수정 유효성 검사
	public int checkEditAddr(AddressVo vo) {
		
		int Aname_result = 0;
		int Addr_result = 0;
		
		if (!(vo.getA_name().equals(vo.getOriginal_a_name()))) {
			Aname_result = dao.checkAname(vo);
		} else {
			Aname_result = 0;
			Addr_result = dao.checkAddr(vo);
		}
		
		int result = 0;
		
		if (Aname_result != 0) {
			result = 1;
		} else if (Addr_result != 0) {
			result = 2;
		}
		
		return result;
	}
	
	//배송지 개수 단순 조회
	public int checkAddrCount(int m_idx) {
		return dao.checkAddrCount(m_idx);
	}
	
	//배송지 추가
	public void addNewAddr(AddressVo vo) {
		dao.addNewAddr(vo);
	}
	
	//배송지 수정페이지 정보 가져오기
	public AddressVo getAddrInfo(int m_idx, String a_name) {
		return dao.getAddrInfo(m_idx, a_name);
	}
	
	//배송지 수정
	public void editAddr(AddressVo vo) {
		dao.editAddr(vo);
	}
	
	//배송지 삭제
	public int deleteAddr(int m_idx, String a_name) {
		return dao.deleteAddr(m_idx, a_name);
	}
}
