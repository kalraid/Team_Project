package com.playground.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import com.playground.beans.Recommend;
import com.playground.dao.RecommendDao;
import com.playground.service.ForwardService;

public class RecommendUpdateProcess implements CommandProcess {

	@Override
	public ForwardService requestProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String contentType = request.getHeader("Content-Type");
		System.out.println("contentType : " + contentType);
		RecommendDao dao = RecommendDao.getInstance();
		Recommend Recommend = null;
		String  pass= null, linklist = null, people = null, good = null, id = null,
				gesimul = null , sNo = null, pageNum = null, type=null, keyword=null, file=null;
		int no = 0;		
		gesimul = request.getParameter("gesimul");
		file= request.getParameter("file");
		
		if(contentType.contains("multipart/form-data")) {
			
			
		
			String uploadDir = 
					(String) request.getServletContext().getAttribute("uploadDir");
			String realPath = request.getServletContext().getRealPath(uploadDir);
			
			int maxFileSize = 100 * 1024 * 1024;
			
			String encoding = "UTF-8"; 
			
			MultipartRequest multi = new MultipartRequest(request, realPath, 
								maxFileSize, encoding, new DefaultFileRenamePolicy());	
			
	
			sNo = multi.getParameter("no");		
			pass = multi.getParameter("pass");
			pageNum = multi.getParameter("pageNum");
			type = multi.getParameter("type");
			keyword = multi.getParameter("keyword");		
			gesimul = multi.getParameter("gesimul");
			file = multi.getParameter("file");
			
			//System.out.println("keyword : " + keyword);
			
	
		/*	if(sNo == null || sNo.equals("") || pass == null || pass.equals("")
				|| pageNum == null || pageNum.equals("")) {

			
				response.setContentType("text/html; charset=utf-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("	alert('정상적인 접근이 아닙니다.');");
				out.println("	history.back();");
				out.println("</script>");
				return null;
			}
			*/
			no = Integer.parseInt(sNo);
			
			
			boolean isPassCheck = dao.isPassCheck(no, pass);
			if(! isPassCheck) {
				System.out.println("비밀번호 맞지 않음");
				
				response.setContentType("text/html; charset=utf-8");
				PrintWriter out = response.getWriter();				
				StringBuilder sb = new StringBuilder();
				sb.append("<script>"); 
				sb.append("	alert('비밀번호가 맞지 않습니다.');");
				sb.append("	history.back();");
				sb.append("</script>");
				out.println(sb.toString());
				return null;
			} 
			
			linklist = multi.getParameter("linklist");
			people = multi.getParameter("people");		
			good = multi.getParameter("good");		
			
			
			Recommend = new Recommend();
			Recommend.setNo(no);
			System.out.println("project.setNO : " + no);
			Recommend.setPass(pass);
			Recommend.setLinklist(linklist);
			Recommend.setPeople(people);
			Recommend.setGood(good);
			Recommend.setGesimul(gesimul);
			Recommend.setFile(file);
			System.out.println("게시물내용: " + gesimul);
				
		
			String fileName = multi.getFilesystemName("file");
			System.out.println("업로드 된 파일명 : " + fileName);
			System.out.println("원본 파일명 : " + multi.getOriginalFileName("file"));
			
			
			Recommend.setFile(fileName != null ? fileName : null);
			
			if(Recommend.getFile() == null) {		
				System.out.println("파일이 업로드 되지 않았음");		
			}
			

		} else {		
			
			request.setCharacterEncoding("utf-8");
			sNo = request.getParameter("no");		
			System.out.println("sNo : " + sNo);
			pass = request.getParameter("pass");
			System.out.println("pass : " + pass);
			pageNum = request.getParameter("pageNum");
			System.out.println("pageNum : " + pageNum);
			type = request.getParameter("type");
			System.out.println("type : " + type);
			keyword = request.getParameter("keyword");
			
			gesimul = request.getParameter("gesimul");
			
			linklist = request.getParameter("linklist");
			System.out.println("keyword : " + keyword);
			
		
		/*	if(sNo == null || sNo.equals("") || pass == null || pass.equals("")
					|| pageNum == null || pageNum.equals("")) {

			
				response.setContentType("text/html; charset=utf-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("	alert('정상적인 접근이 아닙니다.');");
				out.println("	history.back();");
				out.println("</script>");
				return null;
			}*/
			
			no = Integer.parseInt(sNo);
			
		
			boolean isPassCheck = dao.isPassCheck(no, pass);
			if(! isPassCheck) {
				System.out.println("비밀번호 맞지 않음");
				
				response.setContentType("text/html; charset=utf-8");
				PrintWriter out = response.getWriter();				
				StringBuilder sb = new StringBuilder();
				sb.append("<script>");
				sb.append("	alert('비밀번호가 맞지 않습니다.');");
				sb.append("	history.back();");
				sb.append("</script>");
				out.println(sb.toString());
				return null;
			} 
			
			linklist = request.getParameter("linklist");
			people = request.getParameter("people");		
			good = request.getParameter("good");
			
			
		
			Recommend = new Recommend();
			
			Recommend.setNo(no);
			Recommend.setLinklist(linklist);
			Recommend.setId(id);
			Recommend.setPass(pass);
			Recommend.setPeople(people);
			Recommend.setGood(good);
			Recommend.setGesimul(gesimul);
			Recommend.setFile(file);
			
		}
	
		dao.UpdateRecommend(Recommend);

	
		boolean searchOption = (type == null || type.equals("") 
				|| keyword == null || keyword.equals("")) ? false : true; 	
		
	
		String url = "RecommendList.mvc?pageNum=" + pageNum;
		
		if(searchOption) {
			
		
			keyword = URLEncoder.encode(keyword, "utf-8");
			
			url += "&type=" + type + "&keyword=" + keyword; 
		}		

	
		ForwardService forward = new ForwardService();
		forward.setRedirect(true);
		forward.setPath(url);
		return forward;
		
	}

}
