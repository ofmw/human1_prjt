package com.omart.service.boardfile;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.omart.dao.BoardFileDao;
import com.omart.vo.BoardFileVo;

@Service("bfInsert")
public class BoardFileInsertService implements BoardFileService{
	private BoardFileDao dao;
	
	@Autowired
	public BoardFileInsertService(BoardFileDao dao) {
		this.dao = dao;
	}
	
	public int insertBoard(BoardFileVo boardFileVo) {
		
		return dao.insertBoard(boardFileVo);
	}
	

}
