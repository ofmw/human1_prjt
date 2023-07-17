package com.human.service.boardfile;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.human.dao.BoardFileDao;
import com.human.vo.BoardFileVo;

@Service("bfUpdate")
public class BoardFileUpdateService implements BoardFileService {	
	
	private BoardFileDao dao;
	
	@Autowired
	public BoardFileUpdateService(BoardFileDao dao) {
		this.dao = dao;
	}
	
	public int UpdateBoard(MultipartFile attachedFile, int board_idx, String title, String content,
							HttpServletRequest request) {
				
		//1. 저장 디렉터리에 저장할 새로운 파일명 만들기
		String originFileName =attachedFile.getOriginalFilename(); //원본 파일 이름
		
		BoardFileVo vo = new BoardFileVo();
		
		if(originFileName.length() != 0) { //새로운 파일을 선택한 경우
			String ext = originFileName.substring(originFileName.lastIndexOf("."));//파일 확장자를 추출함
			String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
			String saveFileName = now + ext;//새로운 파일이름: 업로드 일시.확장자
			
			//2. 지정된 경로에 파일 저장
			String saveDirectory = request.getServletContext().getRealPath("resources/uploads/");
			String fullPath = saveDirectory + saveFileName;
			
			try {
				attachedFile.transferTo(new File(fullPath));//지정된 경로에 파일 저장
			} catch (IllegalStateException | IOException e) {
				System.out.println("파일 저장 중 예외 발생");
				e.printStackTrace();
			} 
			
			vo.setOriginFile(originFileName);
			vo.setSaveFile(saveFileName);
		}	
		
		//3. 다른 폼의 전달값을 BoardFileVo에 저장하기		
		vo.setBoard_idx(board_idx);
		vo.setTitle(title);
		vo.setContent(content);
		
		return dao.updateBoard(vo);
	}
	
}
