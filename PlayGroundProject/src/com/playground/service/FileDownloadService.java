package com.playground.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 게시 글 상세 보기에서 업로드된 파일을 다운로드 처리하는 서비스 클래스
public class FileDownloadService implements CommandProcess {

	@Override
	public ForwardService requestProcess(
			HttpServletRequest request, HttpServletResponse response)
					throws ServletException, IOException {

		
		
		ServletContext ctx = request.getServletContext();
		String downDir = (String) ctx.getAttribute("uploadDir");
		
		 
		String fileName = request.getParameter("fileName");
		
		
		String downPath = ctx.getRealPath(downDir + "\\" + fileName);
		File file = new File(downPath);
				
		System.out.println("downPath : " + downPath);
		System.out.println("filePath : " + file.getPath() + ", " + file.getName());
				
		
		String mimeType =  ctx.getMimeType(downPath);
		System.out.println("mimeType : " + mimeType);
		
		
		if(mimeType == null) {
			
			mimeType = "application.octec-stream";
		}
		
		
		response.setContentType(mimeType);
		
		String fileNameEncoding = URLEncoder.encode(file.getName(), "UTF-8");
		
		
		fileName = fileNameEncoding.replaceAll("\\+", "%20");
		
		
		response.setHeader("Content-Disposition", 
				"attachment; filename=" + fileName);
		
		
		FileInputStream in = new FileInputStream(file);
		
		
		ServletOutputStream downStream = response.getOutputStream();
		
		
		byte[] b = new byte[1 * 1024 * 1024];
		int readByte = 0;
		
		while((readByte = in.read(b, 0, b.length)) != -1) {
			downStream.write(b, 0, readByte);
		}
		
		
		downStream.flush();
		downStream.close();
		in.close();
		
		
		
		return null;
	}
}
