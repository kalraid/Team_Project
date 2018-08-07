package com.playground.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.playground.beans.thema;
import com.playground.vo.Festival;

public class MainpageDao {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	
	

	
	public ArrayList<Festival> getMainPageFestival(){
		ArrayList<Festival> MainArr = new ArrayList<Festival>();
		String sql = 
				"select distinct c.name, a.* from festival a ,(select a_code,"+
				" row_number() over (order by max(good) desc) as rank,"+ 
				" max(good) as maxgood from festival group by a_code) b, area_code c"+
				" where  a.a_code = c.code and a.a_code = b.a_code and b.rank<=3 and a.good = b.maxgood";
		try {
			pstmt = conn.prepareStatement(sql);
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		return MainArr; 
	}
	
}
