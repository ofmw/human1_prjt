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
public class AddressDao{
	
	public static final String MAPPER = "com.omart.AddressMapper";
	private final SqlSession sqlSession;
	
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
