package com.omart.dao;


import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.omart.vo.BoardFileVo;
import com.omart.vo.MemberVo;
import com.omart.vo.OrderVo;
import com.omart.vo.PointVo;
import com.omart.vo.ProductVo;
import com.omart.vo.WishVo;

@Repository
public class MemberDao{
	
	public static final String MAPPER = "com.omart.MemberMapper";
	//MyBatis를 이용한 DB 연결 및 작업은 SqlSession객체가 담당함
	private SqlSession sqlSession;
	  
	@Autowired
	public MemberDao(SqlSession sqlSession){
		this.sqlSession = sqlSession;
	}
	
	public MemberVo login(String member_id) {
	
		//SQL구문에 입력값이 2개 이상인 경우 Map을 이용해서 입력할 수 있음
		Map<String, String> map = new HashMap<String, String>();
		map.put("m_id", member_id);
		
		return sqlSession.selectOne(MAPPER+".login", map);
	}
	  
	//회원가입 처리
	public int join(MemberVo vo) {	
		return sqlSession.insert(MAPPER+".join", vo);
	}
	
	//가입회원 m_idx 조회
	public int checkM_idx(MemberVo vo) {
		return sqlSession.selectOne(MAPPER+".checkM_idx", vo);
	}
	
	//회원탈퇴
	public int cancel(int m_idx) {
		System.out.println("프로시저에 제공된 m_idx: " +m_idx);
		return sqlSession.delete(MAPPER+".cancel", m_idx);
	}
	
	//가입시 찜목록 생성
	public void insertWish(int m_idx) {
		sqlSession.insert(MAPPER+".insertWish", m_idx);
	}
	
	//찜목록 정보 가져오기
	public List<String> getWishList(int m_idx){
		List<String> wishList = new ArrayList<String>();
				
		WishVo wVo = sqlSession.selectOne(MAPPER+".getWishList", m_idx);
				
		if(wVo!= null) {
			wishList = Arrays.asList(wVo.getW_list().split(","));
		}
		
		return wishList;
	}
	
	//포인트 조회
	public int getPoint(int m_idx) {
		int point = 0;
		
		if(sqlSession.selectOne(MAPPER+".getPoint", m_idx) != null) {
			point = sqlSession.selectOne(MAPPER+".getPoint", m_idx);
		}
		
		return point;
	}
	
	//포인트 사용
	public void usePoint(MemberVo mVo) {			
		sqlSession.update(MAPPER+".usePoint", mVo);
	}
		
	//포인트 적립
	public void addPoint(PointVo pointVo) {
		sqlSession.update(MAPPER+".addPoint", pointVo);
	}
		
	//찜목록에 있는 상품 정보 조회
	public List<ProductVo> getP_info(List<String> wish) {
		
		return sqlSession.selectList(MAPPER+".getP_info", wish);
	}
	
	//찜목록 삭제
	public int removeWishList(int m_idx, String [] p_id) {
		
		System.out.println("회원번호: " +m_idx);
		System.out.println("삭제할 품목 번호: " +Arrays.toString(p_id));
		String modified = String.join(",", p_id);
		System.out.println("변환된 품목 번호: " +modified);
		
		int result = 0;
		
		for (int i=0; i<p_id.length; i++) {
			Map<String, Object> target = new HashMap<>();
			target.put("p_id", p_id[i]);
			target.put("m_idx", m_idx);
			
			System.out.println("삭제 시도 p_id: " +target.get("p_id"));
			
			
			result += sqlSession.update(MAPPER+".removeWishList", target);
			System.out.println("실행된 행 갯수 누적: " +result);
		}
		
		
		
		return result;
	}
	
	public void recordLogin(int m_idx) {
		sqlSession.update(MAPPER+".recordLogin", m_idx);
	}
	
	// 원본 백업
//	public List<OrderVo> orderList(int m_idx) {
//		return sqlSession.selectList(MAPPER+".orderList", m_idx);
//	}
	
	public List<OrderVo> orderList(int m_idx) {
		List<OrderVo> orderList = sqlSession.selectList(MAPPER+".orderList", m_idx);
				
		
		for (OrderVo vo : orderList) {
            
			String p_ids = vo.getProducts();
			String[] p_idArray = p_ids.split(",");
			int p_amount = p_idArray.length;
			vo.setP_amount(p_amount);
        }
		
		return orderList; 
	}
	//아이디 가입여부 조회
	public boolean isDuplicateById(String m_id) {
		int count = sqlSession.selectOne(MAPPER + ".checkId", m_id);
	    return count > 0;
	}
	//전화번호 가입여부 조회
	public boolean isDuplicateBySelNum(String selNum) {
		int count = sqlSession.selectOne(MAPPER + ".checkSelNum", selNum);
	    return count > 0;
	}
	
	public void write_review_process(BoardFileVo bfVo){
		sqlSession.insert(MAPPER+".write_review_process", bfVo);
	}
	
	public List<BoardFileVo> selectReviewList(String p_id){
		return sqlSession.selectList(MAPPER+".selectReviewList", p_id);
	}
	
	public String getMemberNameFromOrder(String order_idx) {
		return sqlSession.selectOne(MAPPER+".getMemberNameFromOrder", order_idx);
	}
	
	public int getGradeFromOrder(String order_idx) {
		return sqlSession.selectOne(MAPPER+".getGradeFromOrder", order_idx);
	}
	
	//비밀번호변경 업데이트 처리
	public MemberVo updatePw(MemberVo vo) {
		int result = sqlSession.update(MAPPER+".updatePwInfo", vo);
		MemberVo updateVo = null;
		if(result == 1) {
			updateVo = sqlSession.selectOne(MAPPER+".selectOne", vo.getM_id());
		}
		
		return updateVo;
	}
	
	//회원정보변경 업데이트 처리
	public MemberVo updateMember(MemberVo vo) {
		int result = sqlSession.update(MAPPER+".updateMemberInfo", vo);
		MemberVo updateVo = null;
		if(result == 1) {
			updateVo = sqlSession.selectOne(MAPPER+".selectOne", vo.getM_id());
		}
		
		return updateVo;
	}
	
	//회원의 총 구매액 구하기
	public int checkTotalPaid(int m_idx) {
		return sqlSession.selectOne(MAPPER+".checkTotalPaid", m_idx);
	}
	
	//등급 업
	public void gradeUp(int m_idx) {
		sqlSession.update(MAPPER+".gradeUp", m_idx);
	}
	
}
