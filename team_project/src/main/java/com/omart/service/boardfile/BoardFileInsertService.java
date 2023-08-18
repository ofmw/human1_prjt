package com.omart.service.boardfile;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.omart.dao.BoardFileDao;
import com.omart.vo.BoardFileVo;

@Service("bfInsert")
public class BoardFileInsertService implements BoardFileService {
	
private BoardFileDao dao;
	
	@Autowired
	public BoardFileInsertService(BoardFileDao dao) {
		this.dao = dao;
	}
	
	public int insertNotice(BoardFileVo boardFileVo) {
		
		return dao.insertNotice(boardFileVo);
	}
	

	public int insertInquiry(BoardFileVo boardFileVo) {
		
		return dao.insertInquiry(boardFileVo);
	}
	
	public int insertInquiryAnswer(BoardFileVo boardFileVo) {
		return dao.insertInquiryAnswer(boardFileVo);
	}
	
	public int insertQnaAnswer(BoardFileVo boardFileVo) {
		return dao.insertQnaAnswer(boardFileVo);
	}
	
	public int insertFaq(BoardFileVo boardFileVo) {
		
		return dao.insertFaq(boardFileVo);
	}

	public int insertEvent(MultipartFile attachedFile, 
			String title, String period, String content, int m_idx, HttpServletRequest request) {
		String originFileName = attachedFile.getOriginalFilename();
		String ext = originFileName.substring(originFileName.lastIndexOf("."));
		String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
		String saveFileName = now+ext;
		String saveDirectory = request.getServletContext().getRealPath("resources/uploads/");
		String fullPath = saveDirectory + saveFileName;
		
		try {
			attachedFile.transferTo(new File(fullPath));
		}catch(IllegalStateException | IOException e) {
			System.out.println("파일 저장 중 예외 발생");
			e.printStackTrace();
		}
		
		BoardFileVo vo = new BoardFileVo();
		vo.setTitle(title);
		vo.setPeriod(period);
		vo.setContent(content);
		vo.setM_idx(m_idx);
		vo.setOriginFile(originFileName);
		vo.setSaveFile(saveFileName);
		
		int result = dao.insertEvent(vo);{
			if (result > 0) {
				return 1;
			} else {
				return 0;
			}
		}
	}
		

}
