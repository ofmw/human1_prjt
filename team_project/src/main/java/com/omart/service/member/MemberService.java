package com.omart.service.member;

import java.util.List;

import com.omart.vo.AddressVo;
import com.omart.vo.BoardFileVo;
import com.omart.vo.MemberVo;
import com.omart.vo.OrderVo;
import com.omart.vo.PointVo;
import com.omart.vo.ProductVo;

public interface MemberService {

	default MemberVo login(String m_id, String m_pw) {return null;}
	default MemberVo klogin(String m_id) {return null;}
	default int join(MemberVo memberVo) {return 0;}
	default int checkM_idx(MemberVo vo) {return 0;}
	default List<String> getWishList(int m_idx){return null;}
	default int getPoint(int m_idx){return 0;}
	default void usePoint(MemberVo memberVo){}
	default List<ProductVo> getP_info(List<String> wish) {return null;}
	default void insertWish(int m_idx) {}
	default int removeWishList(int m_idx, String [] p_id) {return 0;}
	default List<AddressVo> AddressList(int m_idx) {return null;}
	default List<AddressVo> updateDefAddress(int m_idx, String a_name) {return null;}
	default int checkNewAddr(AddressVo newAddr) {return 0;}
	default int checkAddrCount(int m_idx) {return 0;}
	default void addNewAddr(AddressVo newAddr) {}
	default int deleteAddr(int m_idx, String a_name) {return 0;}
	default AddressVo getAddrInfo(int m_idx, String a_name) {return null;}
	default int checkEditAddr(AddressVo vo) {return 0;}
	default void editAddr(AddressVo vo) {}
	default void recordLogin(int m_idx) {}
	default boolean checkDuplicateId(String m_id) {return false;}
	default int cancel(int m_idx) {return 0;}
	default List<ProductVo> get_p_info(List<OrderVo> ph_info) {return null;}
	default List<ProductVo> get_p_info2(String[] p_idArr) {return null;}
	default List<OrderVo> orderList(int m_idx) {return null;}
	default boolean checkDuplicateSelNum(String selNum) {return false;}
	default void write_review_process(BoardFileVo vo){}
	default List<BoardFileVo> selectReviewList(String p_id){return null;}
	default String getMemberNameFromOrder(String order_idx) {return null;}
	default int getGradeFromOrder(String order_idx) {return 0;}
	default public void addPoint(PointVo pointVo) {}
	default MemberVo updatePw(MemberVo memberVo) {return null;}
	default MemberVo updateMember(MemberVo memberVo) {return null;}
	
}
