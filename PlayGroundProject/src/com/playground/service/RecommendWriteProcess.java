package com.playground.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.playground.beans.Recommend;
import com.playground.dao.RecommendDao;

public class RecommendWriteProcess implements CommandProcess {

	@Override
	public ForwardService requestProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	      String uploadDir = 
	            (String) request.getServletContext().getAttribute("uploadDir");
	      String realPath = request.getServletContext().getRealPath(uploadDir);      
	      
	      
	      String people = null , linklist = null, pass = null, gesimul=null , file =null ,id= null;
	      
	      
	   
	      int maxFileSize = 100 * 1024 * 1024;
	      
	      
	      String encoding = "UTF-8"; 
	         
	   
	      MultipartRequest multi = new MultipartRequest(request, realPath, 
	                     maxFileSize, encoding, new DefaultFileRenamePolicy());   
	          
	    
	      Recommend Recommend = new Recommend();
	      
	     
	         
	      /* 사용자가 업로드한 파일 데이터 처리
	       * MultipartRequest 객체를 통해 파일 이름을 구하여 변수에 저장한다.
	       * 파일이 업로드 되지 않으면 fileName은 null 값을 받는다.
	       **/
	      String fileName = multi.getFilesystemName("file");
	      System.out.println("업로드 된 파일명 : " + fileName);
	      System.out.println("원본 파일명 : " + multi.getOriginalFileName("file"));
	      
	      // 파일명이 존재하면 파일명을 지정하고 존재하지 않으면 null로 지정 한다.    
	      Recommend.setFile(fileName != null ? fileName : null);
	      
	      if(Recommend.getFile() == null) {      
	         System.out.println("파일이 업로드 되지 않았음");      
	      }   
	      
	
		String People = multi.getParameter("people");
		String Linklist = multi.getParameter("linklist");
		String Gesimul = multi.getParameter("gesimul");
		String Id = multi.getParameter("id");
		String File = multi.getParameter("file");
		System.out.println("File : " + File);
		
		RecommendDao dao = RecommendDao.getInstance();
		
		
		Recommend.setLinklist(Linklist);
		Recommend.setId(Id);
		Recommend.setPeople(People);
		Recommend.setGesimul(Gesimul);
		Recommend.setFile(fileName);
		
		System.out.println(Recommend.getFile());
		
		
		dao.insertRecommend(Recommend);
		
		
		ForwardService forward = new ForwardService();
		forward.setRedirect(false);
		forward.setPath("RecommendList.mvc");
		return forward;
	}

}
