package com.omart.service.boardfile;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.omart.dao.BoardFileDao;

@Service("bfState")
public class BoardFileStateService implements BoardFileService{
	
private BoardFileDao dao;
	
	@Autowired
	public BoardFileStateService(BoardFileDao dao) {
		this.dao = dao;
	}
	
	public void changeInquiryState(int b_idx) {
		dao.changeInquiryState(b_idx);
	}

	public void changeQnaState(int b_idx) {
		dao.changeQnaState(b_idx);
	}
}
