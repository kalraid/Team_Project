package com.playground.service;
/*package service;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProjectDao;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import beans.Recommend;
import dao.RecommendDao;
import service.ForwardService;

public class RecommendUpdateProcess implements CommandProcess {

	@Override
	public ForwardService requestProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String contentType = request.getHeader("Content-Type");
		System.out.println("contentType : " + contentType);	
		ProjectDao dao = ProjectDao.getInstance();
		Recommend Project = null;
		String  pass= null, linklist = null, people = null, good = null, id = null,
				gesimul = null , sNo = null, pageNum = null, type=null, keyword=null;
		int no = 0;		
		
		
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
			System.out.println("keyword : " + keyword);
			
	
			if(sNo == null || sNo.equals("") || pass == null || pass.equals("")
				|| pageNum == null || pageNum.equals("")) {

			
				response.setContentType("text/html; charset=utf-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("	alert('정상적인 접근이 아닙니다.');");
				out.println("	history.back();");
				out.println("</script>");
				return null;
			}
			
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
			
			
			Project = new Recommend();
			Project.setNo(no);
			Project.setPass(pass);
			Project.setLinklist(linklist);
			Project.setPeople(people);
			Project.setGood(good);
			Project.setGesimul(gesimul);
				
		
			String fileName = multi.getFilesystemName("file");
			System.out.println("업로드 된 파일명 : " + fileName);
			System.out.println("원본 파일명 : " + multi.getOriginalFileName("file"));
			
			
			Project.setFile1(fileName != null ? fileName : null);
			
			if(Project.getFile1() == null) {		
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
			
		
			if(sNo == null || sNo.equals("") || pass == null || pass.equals("")
					|| pageNum == null || pageNum.equals("")) {

			
				response.setContentType("text/html; charset=utf-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("	alert('정상적인 접근이 아닙니다.');");
				out.println("	history.back();");
				out.println("</script>");
				return null;
			}
			
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
			
		
			Project = new Project();
			
			Project.setNo(no);
			Project.setLinklist(linklist);
			Project.setId(id);
			Project.setPass(pass);
			Project.setPeople(people);
			Project.setGood(good);
			Project.setGesimul(gesimul);
			
		}
	
		dao.UpdateProject(Project);

	
		boolean searchOption = (type == null || type.equals("") 
				|| keyword == null || keyword.equals("")) ? false : true; 	
		
	
		String url = "recommendList.mvc?pageNum=" + pageNum;
		
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
*/