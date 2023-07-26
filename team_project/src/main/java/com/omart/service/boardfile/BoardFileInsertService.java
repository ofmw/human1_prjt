package com.omart.service.boardfile;

import javax.servlet.http.HttpServletRequest;

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
	
	public int insertBoard(int b_idx, int m_idx, int category, String title, String content, HttpServletRequest request) {
		BoardFileVo vo = new BoardFileVo();
		vo.setB_idx(b_idx);
		vo.setM_idx(m_idx);
		vo.setCategory(category);
		vo.setTitle(title);
		vo.setContent(content);
		
		return dao.insertBoard(vo);
	}
	

}
