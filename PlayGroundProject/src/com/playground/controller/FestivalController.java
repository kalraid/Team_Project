package com.playground.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.playground.service.CommandProcess;
import com.playground.service.ForwardService;


public class FestivalController extends HttpServlet{
	private static final long serialVersionUID = 1L;

	// 컨트롤러에서 if문을 없애기 위해서 모든 명령과 각각의 명령을 처리할 모델 클래스의 인스턴스를
		//Map에 담아 관리할 것.
		Map<String, CommandProcess> cmdMap = new HashMap<String, CommandProcess>();
		
		// 이 서블릿 클래스가 객체가 되고 서블릿화 될 때 단 한번 실행되는 초기화 메소드
		public void init() throws ServletException{
			//서블릿 초기화 파라미터를 읽는다
			String uriCommand = getInitParameter("uriCommand");
			
			//application을 담당하는 servlet 객체 => ServletContext()
			ServletContext sc = getServletContext();
			String uploadDir =sc.getInitParameter("uploadDir");
			String realPath = sc.getRealPath(uploadDir);
			File parentFile = new File(realPath);
			
			if(!(parentFile.exists() && parentFile.isDirectory())) {
				parentFile.mkdir();
			}
			
			//HashTable을 상속 받은 java.util의 Properties 클래스
			Properties prop = new Properties();
			FileInputStream fis = null;
			BufferedInputStream bis = null;
			
			try {
				String propPath = sc.getRealPath(uriCommand);
				fis= new FileInputStream(propPath);
				bis = new BufferedInputStream(fis);
				
				// key : /boardList.mvc =  value:  com.jspstudy.bbs.service.BoardListService
				prop.load(bis);
				
				
			} catch (IOException e) {
				e.printStackTrace();
			} finally {
				
					try {
						if(bis != null) bis.close();
						if(fis != null) fis.close();
					} catch (IOException e) {
						e.printStackTrace();
					}
			}
			
			System.out.println("prop.size() : "+prop.size());
			Iterator<Object> iter = prop.keySet().iterator();
			
			while(iter.hasNext()) {
				String cmd = (String) iter.next(); //cmd에 key값을 하나씩 꺼내서 자장
				String className = prop.getProperty(cmd); //key값으로 value값을 className에 저장(String)
				
				try {
					Class<?> cmdClass = Class.forName(className); //property의 값을 클래스로 객체를 생성해야 한다. 
					CommandProcess service = (CommandProcess)cmdClass.newInstance(); 
					//CommandProcess는 추상메소드이므로 구형부가 없음. vlaue값인 추상클래스를 인스턴스로 생성
					//newInstance로 클래스를 인스턴스화됩니다. 이 클래스는, 아직 초기화되어 있지 않은 경우에 초기화됩니다.
					
					cmdMap.put(cmd, service);
					
					
					} catch (InstantiationException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (IllegalAccessException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
				} catch (ClassNotFoundException e) {
					e.printStackTrace();
				}
		}
			//업로드 폴더 정보를 ServletContext 객체의 속성에 저장
			//웹 어플리케이션이 구동되는데 필요한 정보를 담고있는 객체
			//jsp 페이지 에서는 application 내장객체로 접근 가능
			sc.setAttribute("uploadDir", uploadDir);
			sc.setAttribute("parentFile", parentFile);
	}
		
		//doGet(),doPost()에서 호출하는 메소드
		protected void doProcess(HttpServletRequest request, HttpServletResponse response) 
				throws ServletException, IOException {
			
			String uri = request.getRequestURI();
			String ctxPath = request.getContextPath();
			String cmd = uri.substring(ctxPath.length());
			System.out.println(cmd);// /index.mvc 만 가져옴
			
			CommandProcess service = cmdMap.get(cmd); //key값으로 경로를 가져옴 , interpace를 상속받은 service의 경로가 service에 들어간다.
			ForwardService forward = service.requestProcess(request, response);
			
			//service에서 값을 받아서 null이 아니면
			if(forward != null) {
				
				//리다이렉트인지 판단
				if(forward.isRedirect()) {
					response.sendRedirect(forward.getPath());
					
				} else {
					RequestDispatcher rd = request.getRequestDispatcher(forward.getPath());
					rd.forward(request, response);
				}
			}
			
		}
		
		
		protected void doGet(HttpServletRequest request, HttpServletResponse response) 
				throws ServletException, IOException {
			
			doProcess(request,response);
		}
		

		protected void doPost(HttpServletRequest request, HttpServletResponse response) 
				throws ServletException, IOException {
			
			request.setCharacterEncoding("utf-8");
			doProcess(request,response);
			
			
			
		}
	
}
