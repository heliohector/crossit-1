package com.web.board.model;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class BoardInfoDO {
	private int boardIndex;			//등록 번호
	private String title;			//글 이름
	private String userName;		//등록자 이름
	private String Content;			//등록 내용
	private String file;			//파일 이름
	private String registerDate;	//등록 일시
	
	public BoardInfoDO() {
	}
	
	//등록 시 입력된 값들을 boardInfoDO에 저장
	public BoardInfoDO getRequestParameter(HttpServletRequest request){
			
		BoardInfoDO infoDO = new BoardInfoDO();
		MultipartRequest upload = null;
			
		String uploadPath = request.getServletContext().getRealPath("downloads");	//업로드 경로
		int maxSize = 5*1024*1024;			//최대 업로드 될 파일 크기 (5MB)
		String encodingType = "utf-8";		//인코딩 타입
			
		try{
			//전송할 파일명을 가지고 있는 객체, 업로드 경로, 최대 업로드 될 파일 크기, 인코딩 타입, 기본보안 적용
			upload = new MultipartRequest(request, uploadPath, maxSize, encodingType, 
							new DefaultFileRenamePolicy());
			
			//전송된 form 파라미터 가져옴
			infoDO.setTitle(upload.getParameter("title"));
			infoDO.setUserName(upload.getParameter("userName"));
			infoDO.setContent(upload.getParameter("content"));
			infoDO.setFile(upload.getFilesystemName("file"));
			
		}catch(Exception e){
			e.printStackTrace();
		} 
		
		return infoDO;
	}	
	
	
	public int getBoardIndex() {
		return boardIndex;
	}
	public void setBoardIndex(int boardIndex) {
		this.boardIndex = boardIndex;
	}
	
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	
	public String getContent() {
		return Content;
	}
	public void setContent(String content) {
		Content = content;
	}
	
	
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	
	
	public String getRegisterDate() {
		return registerDate;
	}
	public void setRegisterDate(String registerDate) {
		this.registerDate = registerDate;
	}
}
