package com.omart.dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.omart.vo.AddressVo;
import com.omart.vo.CartVo;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class CartDao{
	
	public static final String MAPPER = "com.omart.CartMapper";
	private final SqlSession sqlSession;
	
	//해당 회원의 장바구니 정보 가져오기
	public List<CartVo> CartList(int m_idx){

		List<CartVo> vo = sqlSession.selectList(MAPPER+".cartList", m_idx);
		if(vo != null) {
			System.out.println("꽉차있음@@@");
			System.out.println("장바구니 품목 갯수"+vo.size());
		}else {
			System.out.println("비어있음@@@@@@@@@@@");
		}
		return vo;
	}
	
	//해당 회원의 장바구니 상품의 수량 변경하기
	public void cartUpdate_Amount(CartVo newAmount) {
		sqlSession.update(MAPPER+".cartUpdate_Amount", newAmount);
	}
	
	//해당 회원의 장바구니 상품의 수량 변경하기
	public void cartRemove(List<CartVo> target) {

		sqlSession.delete(MAPPER+".cartRemove", target);
	}
	
	//해당 회원의 장바구니 상품의 상세 정보 가져오기
	public List<CartVo> cartUpdate_List(CartVo newAmount) {
		
		System.out.println("━━━━━━━━━━━━━━━━━<장바구니 조회 요청>━━━━━━━━━━━━━━━━━");
		System.out.println("요청 메서드: CartDao.cartUpdate_List");
		
		List<CartVo> vo = sqlSession.selectList(MAPPER+".cartList", newAmount);
		if(vo != null) {
			System.out.println("요청 결과: 성공");
			System.out.println("등록된 장바구니 품목 개수: "+vo.size());
		}else {
			System.out.println("요청 결과: 실패 (등록된 장바구니 품목이 없음)");
		}
		return vo;
	}
	
	//해당 회원의 장바구니에 상품 추가
	public void addCart(CartVo cartVo) {
		System.out.println("cartVo:"+cartVo.getM_idx()+", "+cartVo.getP_id()+", "+cartVo.getAmount());
		CartVo checkVo = sqlSession.selectOne(MAPPER+".checkAmount", cartVo);
		
		if(checkVo != null) {
			if(cartVo.getAmount() + checkVo.getAmount() > 20) {
				cartVo.setAmount(20 - checkVo.getAmount());
			}
		}		
		
		sqlSession.insert(MAPPER+".addCart", cartVo);
	}
	
	//해당 회원의 장바구니에 상품 추가 (마이페이지용.. 임시)
	public int addCart2(int m_idx, String [] p_id) {
		
		CartVo target = new CartVo();
		target.setM_idx(m_idx);
		target.setAmount(1);
		
		int result = 0;
		
		for (int i=0; i<p_id.length; i++) {
			
			target.setP_id(p_id[i]);
			CartVo check = sqlSession.selectOne(MAPPER+".checkAmount", target);
			
			// 장바구니에 해당 상품이 담겨있는지 체크
			if(check != null) { // 해당 상품이 이미 존재한다면
				// 장바구니에 해당 품목 수량 + 추가하는 수량(여기서는 1) 체크
				if(target.getAmount() + check.getAmount() > 20) { // 제한 수량인 20개를 초과하는 경우
					System.out.println(target.getP_id() +" 상품은 제한 수량을 초과했습니다");
				} else {
					result += sqlSession.update(MAPPER+".cartUpdate_Amount2", target);
					System.out.println(target.getP_id() +" 상품 수량 업데이트 완료");
					System.out.println("현재 갯수: " +(check.getAmount()+1));
				}
			} else { // 해당 상품이 없다면
				// 장바구니에 해당 상품 새로 추가
				result += sqlSession.insert(MAPPER+".addCart2", target);
			}
		}
		
		return result;
	}
	
	//장바구니 상품 결제 완료 후 해당 회원의 장바구니에 상품 제거
	public void deleteCartAll(int m_idx) {		
		sqlSession.delete(MAPPER+".deleteCartAll", m_idx);
	}
	
	//해당 회원의 배송지 정보 가져오기
	public List<AddressVo> AddressList(int m_idx){

		System.out.println("━━━━━━━━━━━━━━━━━<회원 배송지 조회 요청>━━━━━━━━━━━━━━━━━");
		System.out.println("요청 메서드: CartDao.AddressList");
		
		List<AddressVo> vo = sqlSession.selectList(MAPPER+".addressList", m_idx);
		if(vo != null) {
			System.out.println("요청 결과: 성공");
			System.out.println("등록된 배송지 개수: "+vo.size());
		}else {
			System.out.println("요청 결과: 실패 (등록된 배송지가 없음)");
		}
		return vo;
	}
	
	//헤당 회원의 기본 배송지 업데이트
	public void updateDefAddress(int m_idx, String a_name) {
		
		Map<String, Object> newDefAdd = new HashMap<>();
		newDefAdd.put("m_idx", m_idx);
		newDefAdd.put("a_name", a_name);
		
		sqlSession.update(MAPPER+".updateDefAddress", newDefAdd);
	}
	
	//배송지 삭제
	public int deleteAddr(int m_idx, String a_name) {
		
		Map<String, Object> target = new HashMap<>();
		target.put("m_idx", m_idx);
		target.put("a_name", a_name);
		
		return sqlSession.delete(MAPPER+".deleteAddr", target);
	}
	
	//배송지 추가 전 유효성 검사 (주소별칭 중복)
	public int checkAname(AddressVo vo) {
		return sqlSession.selectOne(MAPPER+".checkAname", vo);
		
	}
	
	//배송지 추가 전 유효성 검사 (주소 중복, 상세주소까지 완전 일치시)
	public int checkAddr(AddressVo vo) {
		return sqlSession.selectOne(MAPPER+".checkAddr", vo);
	}
	
	//배송지 개수 단순 조회
	public int checkAddrCount(int m_idx) {
		return sqlSession.selectOne(MAPPER+".checkAddrCount", m_idx);
	}
	
	//배송지 추가
	public void addNewAddr(AddressVo vo) {
		sqlSession.insert(MAPPER+".addNewAddr", vo);
	}
	
	//배송지 수정 정보 가져오기
	public AddressVo getAddrInfo(int m_idx, String a_name) {
		
		Map<String, Object> target = new HashMap<>();
		target.put("m_idx", m_idx);
		target.put("a_name", a_name);
		
		return sqlSession.selectOne(MAPPER+".getAddrInfo", target);
	}
	
	//배송지 수정
	public int editAddr(AddressVo vo) {
		return sqlSession.update(MAPPER+".editAddr", vo);
	}
	
}
