package com.omart.service.admin;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.omart.dao.AdminDao;
import com.omart.vo.ProductVo;

import lombok.RequiredArgsConstructor;

@Service("pdEdit")
@RequiredArgsConstructor
public class AdminEditProductService implements AdminService {	
	
	private final AdminDao dao;
	
	public int editProduct(ProductVo productVo, MultipartFile thumbnail, HttpServletRequest request) {
		
		//1. 저장 디렉터리에 저장할 새로운 파일명 만들기
		String originFileName = thumbnail.getOriginalFilename();
		
		System.out.println(originFileName);
		
		if(originFileName.length() != 0) {
			String ext = originFileName.substring(originFileName.lastIndexOf("."));//파일 확장자를 추출함
			String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
			String saveFileName = now + ext;//새로운 파일이름: 업로드 일시.확장자
			
			//2. 지정된 경로에 파일 저장
			String saveDirectory = request.getServletContext().getRealPath("resources/uploads/");
			String fullPath = saveDirectory + saveFileName;
			
			try {
				thumbnail.transferTo(new File(fullPath));//지정된 경로에 파일 저장
			} catch (IllegalStateException | IOException e) {
				System.out.println("파일 저장 중 예외 발생");
				e.printStackTrace();
			} 
			
			productVo.setOriginFile1(originFileName);
			productVo.setSaveFile1(saveFileName);
		}
		return dao.editProduct(productVo);
	}
	
}
