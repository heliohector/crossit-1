package com.web.board.model;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.IOUtils;

public class TeamInfoDO {
	private int teamIndex;			//번호
	private String userName;		//이름
	private String department;		//팀 분류
	private String fileName;		//파일 이름
	private byte[] file;			//파일
	

	public TeamInfoDO() {
	}
	
	/*
	public void getimage(HttpServletRequest req, HttpServletResponse res) throws IOException{
		res.setContentType("image/jpg");
		byte[] imagefile = file;
		InputStream stream = new ByteArrayInputStream(imagefile);
		IOUtils.copy(stream, res.getOutputStream());
	}*/
	
	public int getTeamIndex() {
		return teamIndex;
	}
	public void setTeamIndex(int teamIndex) {
		this.teamIndex = teamIndex;
	}

	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}

	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	public byte[] getFile() {
		return file;
	}
	public void setFile(byte[] file) {
		this.file = file;
	}

}
