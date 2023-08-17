package com.omart.service.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.omart.vo.MemberVo;
import com.omart.vo.OrderVo;
import com.omart.vo.ProductVo;

public interface AdminService {

	default int countCategory(String category) {return 0;}
	default int insertProduct(ProductVo productVo, MultipartFile thumbnail, HttpServletRequest request) {return 0;}
	default List<MemberVo> memberList() {return null;}
	default List<MemberVo> adminList() {return null;}
	default int editProduct(ProductVo productVo, MultipartFile thumbnail, HttpServletRequest request) {return 0;}
	default int productStateTrue(String p_id) {return 0;}
	default int productStateFalse(String p_id) {return 0;}
	default int deleteProduct(String p_id) {return 0;}
	default int createAccount(MemberVo memberVo) {return 0;}
	default int checkAccount(String m_id) {return 0;}
	default int getAccount(String m_id) {return 0;}
	default List<OrderVo> orderList() {return null;}
	default void changeOrderState(String order) {}
	
}
