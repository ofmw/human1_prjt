package com.human.service.boardfile;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.human.dao.BoardFileDao;
import com.human.vo.BoardFileVo;

@Service("bfView")
public class BoardFileViewService implements BoardFileService {	
	
	private BoardFileDao dao;
	
	@Autowired
	public BoardFileViewService(BoardFileDao dao) {
		this.dao = dao;
	}
	
	public BoardFileVo SelectView(int board_idx) {
		
		BoardFileVo vo = dao.selectView(board_idx);		
		
		return vo;
	}
	
}
