package com.human.service.boardfile;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.human.dao.BoardFileDao;
import com.human.vo.BoardFileVo;
import com.human.vo.MemberVo;

@Service("bfDelete")
public class BoardFileDeleteService implements BoardFileService {	
	
	private BoardFileDao dao;
	
	@Autowired
	public BoardFileDeleteService(BoardFileDao dao) {
		this.dao = dao;
	}
	
	public int DeletePost(int board_idx, HttpServletRequest request) {
		int result = 0;
		
		BoardFileVo vo = dao.selectView(board_idx);
		HttpSession session = request.getSession();
		
		//로그인된 회원의 member_idx 얻기
		MemberVo mvo = (MemberVo)session.getAttribute("member");
		int m_idx = mvo.getMember_idx();
		
		if(m_idx == vo.getMember_idx()) {
			result = dao.deletePost(vo);		
		}		
		
		return result;
	}
	
}
