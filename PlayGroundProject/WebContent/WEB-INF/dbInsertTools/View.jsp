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

			out.println("<script>");
			out.println("	alert('자료가 다 집어넣어졌습니다');");
			out.println("	history.back();");
			out.println("</script>");
%>