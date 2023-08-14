package com.omart.service.member;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.omart.dao.MemberDao;
import com.omart.vo.BoardFileVo;
import com.omart.vo.ProductVo;

import lombok.Setter;

@Service("mReview")
public class MemberReviewService implements MemberService {
	
	@Setter(onMethod_={ @Autowired })
	private MemberDao dao;
	
	public void write_review_process(BoardFileVo bfVo){
		dao.write_review_process(bfVo);
	}
	
	public List<BoardFileVo> selectReviewList(String p_id){
		return dao.selectReviewList(p_id);
	}
	
}