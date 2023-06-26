<%@page import="dao.BoardFileDao"%>
<%@page import="vo.BoardFileVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.BoardFileVo, dao.BoardFileDao, util.JSFunction" %>
<%@ page import="java.util.Date, java.util.List" %>
<%@ page import="java.io.File, java.text.SimpleDateFormat" %>
<%@ page import="com.oreilly.servlet.MultipartRequest, com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	String saveDirectory = application.getRealPath("/uploads");//업로드된 파일을 저장할 디렉토리
	int maxPostSize = 1024*1024*5;//파일 최대 크기(5MB)
	String encoding = "UTF-8";

try{
	
	//1. MultipartRequest객체 생성
	//new DefaultFileRenamePolicy() : 동일한 파일명이 저장 디렉터리 내에 존재하면 새로운 이름이 부여되도록 함
	MultipartRequest mRequest = new MultipartRequest(request, saveDirectory, maxPostSize, encoding, new DefaultFileRenamePolicy());
	
	//2. 저장 디렉토리에 저장할 새로운 파일명 만들기
	String originFileName = mRequest.getFilesystemName("attachedFile");//원본파일 이름
	String ext = originFileName.substring(originFileName.lastIndexOf("."));//파일 확장자를 추출함
	String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
	String saveFileName = now + ext;//새로운 파일이름 : 업로드 일시.확장자
	
	//3. 파일명 변경
	File originFile = new File(saveDirectory + File.separator + originFileName);
	File saveFile = new File(saveDirectory + File.separator + saveFileName);
	originFile.renameTo(saveFile);
	
	//4. 다른 폼의 전달값 받고 BoardFileVo생성해서 저장하기
	String title = mRequest.getParameter("title");
	String content = mRequest.getParameter("content");
	int m_idx = Integer.parseInt(mRequest.getParameter("m_idx"));
	String m_name = mRequest.getParameter("m_name");
	
	BoardFileVo vo = new BoardFileVo();
	vo.setTitle(title);
	vo.setContent(content);
	vo.setOriginFile(originFileName);
	vo.setSaveFile(saveFileName);
	vo.setM_idx(m_idx);
	vo.setM_name(m_name);	
	
	//DAO객체를 통해 VO에 저장된 내용을 DB에 저장
    BoardFileDao dao = new BoardFileDao();
    
    int result = dao.insertPreset(vo);
    
    if(result == 1){//글 등록 성공시
    	dao.addScore(vo);
        dao.close();
        response.sendRedirect("../preset.jsp");
    }else{
        dao.close();
        JSFunction.alertBack("글 등록에 실패했습니다.", out);
    }
	
}catch(Exception e){
	System.out.println("글 등록 중 예외 발생");
	e.printStackTrace();
}
	

%>

</body>
</html>