package com.omart.service.boardfile;

import javax.servlet.http.HttpServletRequest;


public interface BoardFileService {
	default int insertBoard(int b_idx, int m_idx, int category, String title, String content, HttpServletRequest request) {return 0;}
}
