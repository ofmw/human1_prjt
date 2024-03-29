package com.omart.service.boardfile;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.omart.vo.BoardFileVo;

@Service
public interface BoardFileService {
	default int insertInquiry(BoardFileVo boardFileVo) {return 0;}
	default int insertInquiryAnswer(BoardFileVo boardFileVo) {return 0;}
	default int insertQnaAnswer(BoardFileVo boardFileVo) {return 0;}
	default int insertNotice(BoardFileVo boardFileVo) {return 0;}
	default int insertFaq(BoardFileVo boardFileVo) {return 0;}
	default int insertEvent(MultipartFile attachedFile, 
			String title, String period, String content, int m_idx, HttpServletRequest request) {return 0;}
	default void changeInquiryState(int b_idx) {}
	default void changeQnaState(int b_idx) {}
	default List<BoardFileVo> getAllFaqes()	{return null;}
	default List<BoardFileVo> getAllNotices() {return null;}
	default List<BoardFileVo> getAllEvents() {return null;}
	default List<BoardFileVo> getAllInquiries() {return null;}
	default List<BoardFileVo> getInquiryByUser(String userId) {return null;}
	default List<BoardFileVo> getInquiryByBIdx(int b_idx) {return null;}
	default List<BoardFileVo> getAllQnas() {return null;}
	default String getInquiryAns(int b_idx) {return null;}
	default String getQnaAns(int b_idx) {return null;}
}
