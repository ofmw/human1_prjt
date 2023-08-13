package com.omart.service.member;

import java.util.List;

import com.omart.vo.MemberVo;
import com.omart.vo.ProductVo;

public interface MemberService {

	default MemberVo login(String m_id, String m_pw) {return null;}
	default MemberVo klogin(String m_id) {return null;}
	default int join(MemberVo memberVo) {return 0;}
	default List<String> getWishList(int m_idx){return null;}
	default int getPoint(int m_idx){return 0;}
	default void setPoint(MemberVo memberVo){}
	default List<ProductVo> getP_info(List<String> wish) {return null;}
	default void insertWish(int m_idx) {}
	default int removeWishList(int m_idx, String [] p_id) {return 0;}
	default boolean checkDuplicateId(String m_id) {return false;}
	default boolean checkDuplicateSelNum(String selNum) {return false;}
}
