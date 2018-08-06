<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.playground.map.*"%>
<%
	placeinsert pl = new placeinsert();
	mapingtest map = new mapingtest();
	dbInsert db = new dbInsert();
	ArrayList<placeinsert> result = (ArrayList<placeinsert>) request.getAttribute("result");
	String name = (String)request.getAttribute("name2");
	int size = (Integer) request.getAttribute("size");
	int num = db.st_check(name); 
	db.P_insert(result);
	ArrayList<Integer> list = db.pn_check(result);
	db.lastInsert(list, num);
	System.out.println("끝!");

	
	// 넣어야할것 result 집어넣어서 place에 넣기 , name으로 smallthema랑 같은지 확인, 
	// pla_thema에 맞춰주기
	
	
	response.sendRedirect("form.html");
%>